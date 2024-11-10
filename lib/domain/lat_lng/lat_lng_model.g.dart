// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lat_lng_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LatLngDataAdapter extends TypeAdapter<LatLngData> {
  @override
  final int typeId = 0;

  @override
  LatLngData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LatLngData(
      fields[0] as double,
      fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LatLngData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatLngDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
