part of 'violation_bloc.dart';

@freezed
class ViolationEvent with _$ViolationEvent {
  const factory ViolationEvent.started() = _Started;
  const factory ViolationEvent.getViolation() = _Violation;
}
