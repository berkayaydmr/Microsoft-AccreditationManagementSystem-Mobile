import 'dart:core';
import 'dart:developer' as developer;
import 'dart:io';
import 'dart:typed_data';

import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/core/extensions/string_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

Container appBarLinearGradient(){
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFBA1A1A), Colors.black],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  );
}

String removeTrailingSpaces(String text) {
  if (text != null) {
    return text.replaceAll(RegExp(r'\s+$'), '');
  }
  return text;
}

Future<Uint8List> loadImageAsync(String imageUrl) async {
  // Resim yükleme işlemleri burada gerçekleştirilir
  // imageUrl parametresi kullanılarak resim ağdan veya önbellekten yüklenir
  // Sonuç olarak Uint8List formatında resim verileri döndürülür

  try {
    var dio = Dio();
    var response = await dio.get(imageUrl, options: Options(responseType: ResponseType.bytes));
    if (response.statusCode == 200) {
      return response.data as Uint8List;
    } else {
      throw Exception('Resim yüklenirken bir hata oluştu.');
    }
  } catch (error) {
    throw Exception('Resim yüklenirken bir hata oluştu: $error');
  }
}

Widget platformIndicator() {
  return Center(
    child: Platform.isIOS
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator(),
  );
}

IconButton platformBackButton({
  required VoidCallback onPressed,
  Color? color = Colors.black,
}) {
  return Platform.isIOS
      ? IconButton(
    onPressed: onPressed,
    icon: Icon(
      Icons.arrow_back_ios,
      color: color,
    ),
  )
      : IconButton(
    onPressed: onPressed,
    icon: Icon(
      Icons.arrow_back,
      color: color,
    ),
  );
}

Icon platformForwardIcon() {
  return Platform.isIOS
      ? const Icon(Icons.arrow_forward_ios)
      : const Icon(Icons.arrow_forward);
}

Future<dynamic> buildInkDialog(
    BuildContext context, String username, String imagePath) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: context.edgeNormalHorizontal,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.normalValue, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: context.radiusValue,
                            topRight: context.radiusValue),
                        color: context.colors.surface,
                      ),
                      child: Text(
                        username ?? '',
                        style: TextStyle(
                            color: context.colors.onSurface,
                            fontSize: context.height * 0.028),
                      )),
                  IconButton(
                    onPressed: () {
                      closePopup(context);
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: context.colors.surface,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: context.radiusValue,
                        topRight: context.radiusValue,
                        bottomLeft: context.radiusValue),
                    border: Border.all(color: context.colors.surface)),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: context.radiusValue,
                      topRight: context.radiusValue,
                      bottomLeft: context.radiusValue),
                  child: Image.network(
                    imagePath ?? "",
                    fit: BoxFit.cover,
                    cacheWidth: 1000,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: Padding(
                          padding: context.edgeNormal,
                          child: CircularProgressIndicator(
                            color: context.colors.surface,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, object, stackTrace) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

/// It is especially useful in [BLoC] structure.
Widget errorText(String errorMessage) {
  return Center(child: Text(errorMessage));
}

logControl(String message) {
  developer.log(message);
}

SvgPicture buildSvgPicture(String path) {
  return SvgPicture.asset(path.toSvg);
}

Image buildImageAsset(String path) {
  return Image.asset(path.toPng);
}

BoxShadow buildBoxShadow() {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 1,
    blurRadius: 7,
    offset: const Offset(0, 1), // changes position of shadow
  );
}

LinearGradient buildLinearGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 1),
    colors: <Color>[Color(0xFFFC6C35), Color(0xFF6495ED)],
    tileMode: TileMode.mirror,
  );
}

SizedBox buildVerticalSizedBox() {
  return const SizedBox(height: 10);
}

SizedBox buildHorizontalSizedBox() {
  return const SizedBox(width: 10);
}

/*animatedRouting({
  required GoRouterState state,
  required Widget route,
}) =>
    CustomTransitionPage<void>(
      key: state.pageKey,
      child: route,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
        ),
        child: child,
      ),
    );*/

closePopup(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}

String toShortString(String value, {int countCharacter = 8}) {
  return value.length > countCharacter
      ? "${value.substring(0, countCharacter)}..."
      : value;
}

String toShortDoubleNumber(double value) {
  String number = value.toString();
  return "${number.split(".").first}.${number.split(".")[1].substring(0, 2)}";
}

String convertStringDateYmm(String date) {
  return DateFormat.yMMMEd('tr_TR').format(DateTime.parse(date));
}

String convertStringDateTime(String date) {
  return DateFormat('dd/MM/yyyy hh:mm ').format(DateTime.parse(date));
}

String convertStringDateYmmm(String date) {
  return DateFormat.yMMMMEEEEd('tr_TR').format(DateTime.parse(date));
}

String convertStringDateYMMd(String date) {
  return DateFormat.yMMMd('tr_TR').format(DateTime.parse(date));
}

String convertStringDate4(String date) {
  return DateFormat.Hm('tr_TR').format(DateTime.parse(date));
}

String getImageUrl(String imageName) {
  return "https://pine-ink-bucket.s3.eu-central-1.amazonaws.com/$imageName";
}

