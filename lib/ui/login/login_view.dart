import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/core/navigation/navigation.dart';
import 'package:accreditation_management_system/repository/models/login_request_model.dart';
import 'package:accreditation_management_system/repository/user_repository.dart';
import 'package:accreditation_management_system/ui/login/bloc/login_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/image_constants.dart';
import '../../core/constants/local_storage_constants.dart';
import '../../core/local_storage/local_storage_manager.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  LoginView({Key? key, this.onResult}) : super(key: key);
  late ValueChanged<bool>? onResult;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Add form key

  late LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc =
        LoginBloc(userRepository: RepositoryProvider.of<IUserRepository>(context));
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: context.height,
          padding: context.edgeNormal,
          child: Form( // Wrap your content with Form widget
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstants.instance.logo,
                  width: 300,
                  cacheHeight: 200,
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: context.textTheme.titleMedium,
                    border: OutlineInputBorder(
                      borderRadius: context.radiusAll,
                    ),
                    errorMaxLines: 3,
                    icon: Icon(Icons.email), // Add icon
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Şifre',
                    hintStyle: context.textTheme.titleMedium,
                    border: OutlineInputBorder(
                      borderRadius: context.radiusAll,
                    ),
                    errorMaxLines: 3,
                    icon: Icon(Icons.lock), // Add icon
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: context.radiusAll,
                    ),
                    fixedSize: Size.fromWidth(context.width),
                  ),
                  onPressed: _login,
                  child: const Text(
                    'Giriş Yap',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(onPressed: register, child: Text('Kayıt Olun')),
                TextButton(
                  onPressed: () {
                    context.router.push(EngineerViewRoute());
                  },
                  child: Text('Giriş bilgilerimi unuttum'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      _loginBloc.add(LoginButtonPressed(
        loginRequest: LoginRequestModel(
          email: _usernameController.text,
          password: _passwordController.text,
          authenticatorCode: "authCode",
        ),
      ));

      _loginBloc.stream.listen((event) {
        if (event is LoginFailure) {
          BotToast.showText(text: event.error);
        }

        if (event is LoginSuccess) {
          context.replaceRoute(DashboardViewRoute(username: _extractUsername(_usernameController.text)));
        }
      });
    }
  }

  void register() {
    context.router.push(EngineerAddViewRoute());
  }

  String _extractUsername(String email) {
    int atIndex = email.indexOf('@');
    if (atIndex != -1) {
      return email.substring(0, atIndex);
    } else {
      return email;
    }
  }
}
