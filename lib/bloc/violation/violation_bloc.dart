import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:frontend_aps/data/datasources/violation_remote_datasources.dart';
import '../../data/models/response/violation_response_models.dart';

part 'violation_event.dart';
part 'violation_state.dart';
part 'violation_bloc.freezed.dart';

class ViolationBloc extends Bloc<ViolationEvent, ViolationState> {
  final ViolationRemoteDataSources dataSource;

  ViolationBloc(this.dataSource) : super(const _Initial()) {
    on<ViolationEvent>((event, emit) async {
      emit(const _Loading());
      final response = await ViolationRemoteDataSources().getViolation();
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data.data!)),
      );
    });
  }
}
