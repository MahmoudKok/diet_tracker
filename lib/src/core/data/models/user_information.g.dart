// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInformationAdapter extends TypeAdapter<UserInformation> {
  @override
  final typeId = 1;

  @override
  UserInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInformation(
      id: (fields[1] as num).toInt(),
      name: fields[3] as String,
      email: fields[5] as String?,
      emailVerifiedAt: fields[7] as String?,
      token: fields[9] as String,
      role: (fields[11] as num?)?.toInt(),
      createdAt: fields[13] as String?,
      updatedAt: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserInformation obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.emailVerifiedAt)
      ..writeByte(9)
      ..write(obj.token)
      ..writeByte(11)
      ..write(obj.role)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) =>
    UserInformation(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      token: json['token'] as String,
      role: (json['role'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserInformationToJson(UserInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'token': instance.token,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
