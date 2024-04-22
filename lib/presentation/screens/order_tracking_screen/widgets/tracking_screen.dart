import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_event.dart';
import 'package:pharma/models/tracking_model.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  double x = 33.33353973430781;
  double y = 36.249999;

  final Completer<GoogleMapController> _controller = Completer();
  // static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(33.33353973430781, 36.249999);
  StreamSocket streamSocket = StreamSocket();
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    // context.read<LocationBloc>().state.addressCurrent.longitude!;
    getPolyPoints();
    getCurrentLocation();
    // connectAndListen();
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
          zoom: 13.5,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("currentLocation"),
            position: LatLng(
              x,
              y,
            ),
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
          ),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylineCoordinates,
            color: const Color(0xFF7B61FF),
            width: 6,
          ),
        },
      ),
    );
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAX8XoECKD0-gnAaah67gR4akbUodB_8Ww", // Your Google Map Key
      const PointLatLng(33.33353973430781, 36.241999),
      const PointLatLng(33.33353973430781, 36.249999),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      setState(() {});
    }
    // print('@@@@@@@@@@@@@');
    // print(polylineCoordinates);
    // print('@@@@@@@@@@@@@@');
  }

  void getCurrentLocation() async {
    IO.Socket socket = IO.io(
      "ws://farmy.tracking.peaklink.site:3000?order_id=242",
      OptionBuilder().setTransports(['websocket']).build(),
    );
    GoogleMapController googleMapController = await _controller.future;

    socket.onConnect((_) {
      print('connect');
    });

    socket.on("track_242", (data) {
      final GetUserRatesModel userModel = GetUserRatesModel.fromJson(data);
      streamSocket.addResponse(userModel);
      x = userModel.lat;
      y = userModel.long;
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 13.5,
            target: LatLng(
              userModel.lat,
              userModel.long,
            ),
          ),
        ),
      );
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
