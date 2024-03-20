// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_basket_params.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetBasketParamsAdapter extends TypeAdapter<GetBasketParams> {
  @override
  final int typeId = 3;

  @override
  GetBasketParams read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetBasketParams(
      id: fields[0] as int?,
      idProducts: (fields[1] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, GetBasketParams obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idProducts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetBasketParamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
