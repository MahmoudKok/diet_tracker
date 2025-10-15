// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      code: json['code'] as String?,
      correlationId: json['correlationId'] as String?,
      details: json['details'] as Map<String, dynamic>?,
      retryAfter: json['retryAfter'] == null
          ? null
          : Duration(microseconds: (json['retryAfter'] as num).toInt()),
      service: json['service'] as String?,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'code': instance.code,
      'correlationId': instance.correlationId,
      'details': instance.details,
      'retryAfter': instance.retryAfter?.inMicroseconds,
      'service': instance.service,
    };
