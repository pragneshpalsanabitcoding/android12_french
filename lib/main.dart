import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/modules/language_selection/localeString.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SharedPreferences pref = await SharedPreferences.getInstance();
  var language = pref.getBool("language") ?? false;

  await GetStorage.init();

  runApp(ScreenUtilInit(
      designSize: const Size(411, 797),
      builder: (context, _) {
        return GetMaterialApp(
          translations: LocaleString(),
          // locale: Locale('en', 'US'),
          locale: language == true
              ? const Locale('fr', 'FR')
              : const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      }));
}

const platform = MethodChannel('com.flutter.ads.mediation');
