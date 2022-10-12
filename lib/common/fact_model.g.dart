// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactModelAdapter extends TypeAdapter<FactModel> {
  @override
  final int typeId = 1;

  @override
  FactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FactModel(
      catsFact: fields[0] as String,
      imageUrl: fields[2] as String,
      date: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FactModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.catsFact)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}