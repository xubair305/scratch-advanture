import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: _buildTheme(Brightness.light),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme:
    //  GoogleFonts.smoochSansTextTheme(baseTheme.textTheme)
    ThemeData.light().textTheme.apply(fontFamily: 'Teko'),
  );
}
