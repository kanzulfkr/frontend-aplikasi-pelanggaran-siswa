part of 'point_bloc.dart';

@freezed
class PointEvent with _$PointEvent {
  const factory PointEvent.started() = _Started;
  const factory PointEvent.getPoint() = _Point;
}
