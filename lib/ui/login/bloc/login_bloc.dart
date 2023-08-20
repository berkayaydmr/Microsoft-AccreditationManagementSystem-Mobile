import 'package:accreditation_management_system/core/constants/local_storage_constants.dart';
import 'package:accreditation_management_system/core/local_storage/local_storage_manager.dart';
import 'package:accreditation_management_system/repository/models/login_request_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IUserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        var response = await userRepository.login(event.loginRequest);
        LocalStorageManager.setString(LocalStorageConstants.TOKEN, response.accessToken.token.toString());
        emit(const LoginSuccess(userID: 1));
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }
}
