import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:frontend_aps/data/datasources/user_remote_datasources.dart';
import 'package:frontend_aps/data/models/response/user_poin_response_models.dart';

part 'point_event.dart';
part 'point_state.dart';
part 'point_bloc.freezed.dart';

class PointBloc extends Bloc<PointEvent, PointState> {
  final UserRemoteDataSources dataSource;

  PointBloc(this.dataSource) : super(const _Initial()) {
    on<PointEvent>((event, emit) async {
      emit(const _Loading());
      final response = await UserRemoteDataSources().getUserPoint();
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
