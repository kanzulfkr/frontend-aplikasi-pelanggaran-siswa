part of 'store_violation_bloc.dart';

@freezed
class StoreViolationState with _$StoreViolationState {
  const factory StoreViolationState.initial() = _Initial;
  const factory StoreViolationState.loading() = _Loading;
  const factory StoreViolationState.loaded(ViolationRequestModel data) =
      _Loaded;
  const factory StoreViolationState.error(String message) = _Error;
}
