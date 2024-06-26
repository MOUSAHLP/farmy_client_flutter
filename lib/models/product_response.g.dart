// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductResponseAdapter extends TypeAdapter<ProductResponse> {
  @override
  final int typeId = 0;

  @override
  ProductResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductResponse(
      id: fields[0] as int,
      nameOfProduct: fields[1] as String?,
      price: fields[2] as String?,
      tax: fields[4] as int?,
      quantity: fields[3] as int?,
      attributeList: (fields[5] as List).cast<AttributeResponse>(),
      availabilityOfProduct: fields[6] as String?,
      sellerName: fields[7] as String?,
      discountStatus: fields[8] as String?,
      discountPrice: fields[9] as String?,
      isDiscount: fields[12] as bool?,
      image: fields[10] as String?,
      description: fields[11] as String?,
      relatedProducts: (fields[15] as List?)?.cast<ProductResponse>(),
      similarProducts: (fields[16] as List?)?.cast<ProductResponse>(),
      isFavorite: fields[13] as bool,
      discount: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductResponse obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameOfProduct)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.tax)
      ..writeByte(5)
      ..write(obj.attributeList)
      ..writeByte(6)
      ..write(obj.availabilityOfProduct)
      ..writeByte(7)
      ..write(obj.sellerName)
      ..writeByte(8)
      ..write(obj.discountStatus)
      ..writeByte(9)
      ..write(obj.discountPrice)
      ..writeByte(10)
      ..write(obj.image)
      ..writeByte(11)
      ..write(obj.description)
      ..writeByte(12)
      ..write(obj.isDiscount)
      ..writeByte(13)
      ..write(obj.isFavorite)
      ..writeByte(14)
      ..write(obj.discount)
      ..writeByte(15)
      ..write(obj.relatedProducts)
      ..writeByte(16)
      ..write(obj.similarProducts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
