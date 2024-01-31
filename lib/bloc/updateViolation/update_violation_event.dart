part of 'update_violation_bloc.dart';

@freezed
class UpdateViolationEvent with _$UpdateViolationEvent {
  const factory UpdateViolationEvent.started() = _Started;
  const factory UpdateViolationEvent.updateViolation(
      ViolationUpdateRequestModel requestModels) = _UpdateViolation;
}
