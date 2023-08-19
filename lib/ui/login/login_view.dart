import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/core/navigation/navigation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.edgeNormal,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                ImageConstants.instance.logo,
                width: 300,
                cacheHeight: 200,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: context.textTheme.titleMedium,
                        border: OutlineInputBorder(
                          borderRadius: context.radiusAll,
                        ),
                        errorMaxLines: 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: context.textTheme.titleMedium,
                        border: OutlineInputBorder(
                          borderRadius: context.radiusAll,
                        ),
                        errorMaxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: context.radiusAll),
                        fixedSize: Size.fromWidth(context.width),
                      ),
                      onPressed: () {
                        context.replaceRoute(DashboardViewRoute(
                            username: _usernameController.text));
                      },
                      child: const Text(
                        'Giriş Yap',
                        style: TextStyle(color: Colors.white),
                      )),
                  Column(
                    children: [
                      TextButton(onPressed: () {}, child: Text('Kayıt Olun')),
                      TextButton(
                          onPressed: () {
                            context.router.push(EngineerViewRoute());
                          },
                          child: Text('Giriş bilgilerimi unuttum')),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _login() async {
    await LocalStorageManager.setString(
        LocalStorageConstants.USERNAME, _usernameController.text);
    widget.onResult?.call(true);
  }
}
