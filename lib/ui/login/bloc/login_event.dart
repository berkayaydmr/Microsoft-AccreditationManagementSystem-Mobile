part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final LoginRequestModel loginRequest;

  const LoginButtonPressed({
    required this.loginRequest,
  });

  @override
  List<Object> get props => [loginRequest];

  @override
  String toString() => 'LoginButtonPressed { email: ${loginRequest.email}}';
}
