// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_basket.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalBasketAdapter extends TypeAdapter<LocalBasket> {
  @override
  final int typeId = 99;

  @override
  LocalBasket read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalBasket(
      localBasketProducts: (fields[0] as List).cast<ProductResponse>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalBasket obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.localBasketProducts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalBasketAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
