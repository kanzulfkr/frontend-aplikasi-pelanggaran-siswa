part of 'violation_bloc.dart';

@freezed
class ViolationState with _$ViolationState {
  const factory ViolationState.initial() = _Initial;
  const factory ViolationState.loading() = _Loading;
  const factory ViolationState.loaded(List<Violation> violation) = _Loaded;
  const factory ViolationState.error(String message) = _Error;
}
