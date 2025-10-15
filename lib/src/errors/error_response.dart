// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse extends Equatable {
  final int? statusCode;
  final String? message;
  final String? code;
  final String? correlationId;
  final Map<String, Object?>? details;
  final Duration? retryAfter;
  final String? service;
  const ErrorResponse({
    this.statusCode,
    this.message,
    this.code,
    this.correlationId,
    this.details,
    this.retryAfter,
    this.service,
  });

  @override
  List<Object?> get props => [
    statusCode,
    message,
    code,
    correlationId,
    details,
    retryAfter,
    service,
  ];
}
