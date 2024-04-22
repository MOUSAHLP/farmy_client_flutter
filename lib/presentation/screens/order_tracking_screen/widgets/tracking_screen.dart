import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma/models/tracking_model.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class TrackingScreen extends StatefulWidget {
  final double lat;
  final double long;
  final int orderId;

  const TrackingScreen({
    super.key,
    required this.lat,
    required this.long,
    required this.orderId,
  });

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  double y = 0.0;
  double x = 0.0;

  final Completer<GoogleMapController> _controller = Completer();

  StreamSocket streamSocket = StreamSocket();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  @override
  void initState() {
    getPolyPoints();
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            x,
            y,
          ),
          zoom: 11.5,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("destination"),
            position: LatLng(
              widget.lat,
              widget.long,
            ),
          ),
          Marker(
            markerId: const MarkerId("currentLocation"),
            position: LatLng(
              x,
              y,
            ),
          ),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylineCoordinates,
            color: ColorManager.primaryGreen,
            width: 4,
          ),
        },
      ),
    );
  }

  void getPolyPoints() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCUZlq_lAp7CeU_lPj9z8cZWYC2qE_uRZ4",
      PointLatLng(
        widget.lat,
        widget.long,
      ),
      PointLatLng(x, y),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      setState(() {});
    }
  }

  void getCurrentLocation() async {
    print('@@@@@@@@@@@@@@@@@@');
    print(widget.orderId);
    print(widget.long);
    print(widget.lat);
    print('@@@@@@@@@@@@@@@@@@');
    IO.Socket socket = IO.io(
      "ws://farmy.tracking.peaklink.site:3000?order_id=${widget.orderId}",
      OptionBuilder().setTransports(['websocket']).build(),
    );
    GoogleMapController googleMapController = await _controller.future;
    socket.onConnect((_) {
      print('connect');
    });

    socket.on("track_${widget.orderId}", (data) {
      final GetUserRatesModel userModel = GetUserRatesModel.fromJson(data);
      // Check if the coordinates have changed

      x = userModel.lat;
      y = userModel.long;
      print('####');
      print(x);
      print(y);
      print('####');
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 15,
            target: LatLng(
              x,
              y,
            ),
          ),
        ),
      );
      polylineCoordinates.clear();
      getPolyPoints();

      setState(() {});
    });
    socket.onDisconnect((_) => print('disconnect'));
  }
}

class StreamSocket {
  final _socketResponse = StreamController<GetUserRatesModel>();

  void Function(GetUserRatesModel) get addResponse => _socketResponse.sink.add;

  Stream<GetUserRatesModel> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}
