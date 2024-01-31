// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_aps/data/datasources/violation_remote_datasources.dart';
import 'package:frontend_aps/data/models/request/violation_update_request_models.dart';

part 'update_violation_event.dart';
part 'update_violation_state.dart';
part 'update_violation_bloc.freezed.dart';

class UpdateViolationBloc
    extends Bloc<UpdateViolationEvent, UpdateViolationState> {
  UpdateViolationBloc() : super(const _Initial()) {
    on<_UpdateViolation>((event, emit) async {
      emit(const _Loading());
      final response = await ViolationRemoteDataSources()
          .updateViolation(event.requestModels);
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
