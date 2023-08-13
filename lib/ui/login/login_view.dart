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
  final _nameController = TextEditingController();

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
            SizedBox(
              height: context.height * .2,
            ),
            Image.asset(
              ImageConstants.instance.logo,
              width: 300,
              cacheHeight: 200,
            ),
            SizedBox(
              height: context.highValue,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Adınız ve Soyadınız (örn:Berkay Aydemir)',
                hintStyle: context.textTheme.titleMedium,
                border: OutlineInputBorder(
                  borderRadius: context.radiusAll,
                ),
                errorMaxLines: 3,
              ),
            ),
            SizedBox(
              height: context.lowValue,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(context.width)),
                      onPressed: () {
                        context.replaceRoute(
                            DashboardViewRoute(username: _nameController.text));
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
                          child: Text('Adınızı hatırlamıyor musunuz?')),
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
        LocalStorageConstants.USERNAME, _nameController.text);
    widget.onResult?.call(true);
  }
}
