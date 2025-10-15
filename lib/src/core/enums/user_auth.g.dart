// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAuthAdapter extends TypeAdapter<UserAuth> {
  @override
  final typeId = 7;

  @override
  UserAuth read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserAuth.unauthorized;
      case 1:
        return UserAuth.authorized;
      default:
        return UserAuth.unauthorized;
    }
  }

  @override
  void write(BinaryWriter writer, UserAuth obj) {
    switch (obj) {
      case UserAuth.unauthorized:
        writer.writeByte(0);
      case UserAuth.authorized:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAuthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
