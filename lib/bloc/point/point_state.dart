part of 'point_bloc.dart';

@freezed
class PointState with _$PointState {
  const factory PointState.initial() = _Initial;
  const factory PointState.loading() = _Loading;
  const factory PointState.loaded(UserPointResponseModel point) = _Loaded;
  const factory PointState.error(String message) = _Error;
}
