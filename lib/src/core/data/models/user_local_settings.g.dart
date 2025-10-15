// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_local_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLocalSettingsAdapter extends TypeAdapter<UserLocalSettings> {
  @override
  final typeId = 3;

  @override
  UserLocalSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLocalSettings(
      isFirstTimeOpenApp: fields[0] == null ? true : fields[0] as bool,
      theme: fields[1] as AppThemeType,
      locale: fields[2] as Locale,
      userAuth: fields[3] as UserAuth,
    );
  }

  @override
  void write(BinaryWriter writer, UserLocalSettings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.isFirstTimeOpenApp)
      ..writeByte(1)
      ..write(obj.theme)
      ..writeByte(2)
      ..write(obj.locale)
      ..writeByte(3)
      ..write(obj.userAuth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocalSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
