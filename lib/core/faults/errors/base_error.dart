import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BaseError extends Error with EquatableMixin {
  BaseError({required this.type, required this.message});

  final ErrorType type;
  final String message;

  @override
  List<Object> get props => [type];

  @override
  String toString() => '$type - $message';
}

enum ErrorType {
  inconsistentState,
  coordinatorInconsistentState,
  serviceInconsistentState,
  repositoryInconsistentState,
  viewModelInconsistentState,
  layoutInconsistentState,
  gatewayInconsistentState,

  serialization,
}
