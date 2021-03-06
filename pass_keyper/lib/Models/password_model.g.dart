// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PassWordManagerAdapter extends TypeAdapter<PassWordManager> {
  @override
  final int typeId = 0;

  @override
  PassWordManager read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PassWordManager()
      ..accountName = fields[0] as String
      ..emailId = fields[1] as String
      ..passWord = fields[2] as String
      ..hints = fields[3] as String
      ..colorTag = fields[4] as int
      ..createdDate = fields[5] as DateTime;
  }

  @override
  void write(BinaryWriter writer, PassWordManager obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.accountName)
      ..writeByte(1)
      ..write(obj.emailId)
      ..writeByte(2)
      ..write(obj.passWord)
      ..writeByte(3)
      ..write(obj.hints)
      ..writeByte(4)
      ..write(obj.colorTag)
      ..writeByte(5)
      ..write(obj.createdDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassWordManagerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
