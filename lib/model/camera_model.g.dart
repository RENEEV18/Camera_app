// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CameraModelAdapter extends TypeAdapter<CameraModel> {
  @override
  final int typeId = 1;

  @override
  CameraModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CameraModel(
      image: fields[0] as String,
    )..id = fields[1] as int?;
  }

  @override
  void write(BinaryWriter writer, CameraModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CameraModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
