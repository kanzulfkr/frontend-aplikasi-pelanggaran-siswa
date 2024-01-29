// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_aps/data/datasources/violation_remote_datasources.dart';
import 'package:frontend_aps/data/models/request/violation_request_models.dart';

part 'store_violation_event.dart';
part 'store_violation_state.dart';
part 'store_violation_bloc.freezed.dart';

class StoreViolationBloc
    extends Bloc<StoreViolationEvent, StoreViolationState> {
  StoreViolationBloc() : super(const _Initial()) {
    on<_StoreViolation>((event, emit) async {
      emit(const _Loading());
      final response = await ViolationRemoteDataSources()
          .storeViolation(event.requestModels);
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
