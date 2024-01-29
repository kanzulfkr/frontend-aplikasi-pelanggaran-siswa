part of 'store_violation_bloc.dart';

@freezed
class StoreViolationEvent with _$StoreViolationEvent {
  const factory StoreViolationEvent.started() = _Started;
  const factory StoreViolationEvent.storeViolation(
      ViolationRequestModel requestModels) = _StoreViolation;
}
