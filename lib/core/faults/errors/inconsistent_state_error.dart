import 'package:dowing_app/core/faults/errors/base_error.dart';

class InconsistentStateError extends BaseError {
  InconsistentStateError(String message) : super(type: ErrorType.inconsistentState, message: message);

  InconsistentStateError.coordinator(String message)
      : super(type: ErrorType.coordinatorInconsistentState, message: message);

  InconsistentStateError.service(String message) : super(type: ErrorType.serviceInconsistentState, message: message);

  InconsistentStateError.repository(String message)
      : super(type: ErrorType.repositoryInconsistentState, message: message);

  InconsistentStateError.viewModel(String message)
      : super(type: ErrorType.viewModelInconsistentState, message: message);

  InconsistentStateError.layout(String message) : super(type: ErrorType.layoutInconsistentState, message: message);

  InconsistentStateError.gateway(String message) : super(type: ErrorType.gatewayInconsistentState, message: message);
}
