// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfferModelAdapter extends TypeAdapter<OfferModel> {
  @override
  final int typeId = 1;

  @override
  OfferModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfferModel(
      link: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OfferModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfferModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
