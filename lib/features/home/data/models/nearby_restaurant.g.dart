// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_restaurant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NearbyRestaurantAdapter extends TypeAdapter<NearbyRestaurant> {
  @override
  final int typeId = 0;

  @override
  NearbyRestaurant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NearbyRestaurant(
      id: fields[0] as String?,
      name: fields[1] as String?,
      link: fields[2] as String?,
      timeInMins: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NearbyRestaurant obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.timeInMins);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NearbyRestaurantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
