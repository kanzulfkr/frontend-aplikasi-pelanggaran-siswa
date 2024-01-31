part of 'update_violation_bloc.dart';

@freezed
class UpdateViolationState with _$UpdateViolationState {
  const factory UpdateViolationState.initial() = _Initial;
  const factory UpdateViolationState.loading() = _Loading;
  const factory UpdateViolationState.loaded(ViolationUpdateRequestModel data) =
      _Loaded;
  const factory UpdateViolationState.error(String message) = _Error;
}
