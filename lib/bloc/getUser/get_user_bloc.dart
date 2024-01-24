import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_aps/data/datasources/auth_remote_datasources.dart';
import 'package:frontend_aps/data/models/response/user_response_models.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';
part 'get_user_bloc.freezed.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final AuthRemoteDataSources dataSource;
  GetUserBloc(this.dataSource) : super(const _Initial()) {
    on<_GetProfile>(_getProfile);
  }

  Future<void> _getProfile(
    _GetProfile event,
    Emitter<GetUserState> emit,
  ) async {
    emit(const _Loading());
    final result = await dataSource.getUserProfile();
    result.fold(
      (error) => emit(_Error(message: error)),
      (data) => emit(_Loaded(data: data)),
    );
  }
}
