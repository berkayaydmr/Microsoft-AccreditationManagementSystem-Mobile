import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/login_request.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(super.initialState);

}