import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../constants/api_config.dart';
import '../../../dialogs/snackbar_dialog.dart';
import '../../../dialogs/views/update_app_dialog.dart';
import '../../../models/SettingsModel.dart';
import '../../../models/app_data_model.dart';
import '../../../utilities/api_service_call_utility.dart';
import '../../../utilities/firebase_database_utility.dart';
import '../../profile/controllers/profile_controller.dart';

const platform = MethodChannel('com.flutter.ads.mediation');

class WelcomeController extends GetxController {
  static WelcomeController to = Get.put(WelcomeController());

  //TODO: Implement WelcomeController

  SettingsModel? settingsModel;
  late AppDataModel appDataModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionCode = int.parse(packageInfo.buildNumber);
  }

  RxBool isAdShow = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId(WelcomeController.to.settingsModel!
        .comMinichatJolieVideochatDirect.adSetting.onesignalId);
  }

  String settingsUrl = "";

  Future loadData() async {
    try {
      await FirebaseDatabaseUtil.instance.initState();
      dynamic settingsData =
          await FirebaseDatabaseUtil.instance.readData("France_Ad_Setting");

      if (settingsData != null) {
        settingsUrl = settingsData["url_ad_setting"];
        print("yes $settingsUrl");
      } else {
        settingsUrl =
            "https://raw.githubusercontent.com/pkbitcoding/booya/main/All_Country_apps/Netherland/Ad_Setting.json";
      }

      /// first of all load settings data.
      await ApiServiceCallUtility.instance.request(
          serviceUrl: settingsUrl,
          success: (String response) async {
            settingsModel =
                SettingsModel.fromJson(const JsonDecoder().convert(response));
          },
          error: (String response) {
            SnackBarDialog.instance.show(ApiConfig.ERROR, response);
          },
          isProgressShow: false,
          params: {});

      dynamic appData =
          await FirebaseDatabaseUtil.instance.readData("France_App_Setting");
      String _appUrl = "";
      if (appData != null) {
        _appUrl = appData["url_app_setting"];
      } else {
        _appUrl =
            "https://raw.githubusercontent.com/yoyolive/yoyolive/main/json/AppData.json";
      }

      await ApiServiceCallUtility.instance.request(
          serviceUrl: _appUrl,
          success: (String response) async {
            appDataModel =
                AppDataModel.fromJson(const JsonDecoder().convert(response));
            ProfileController.to.setupSelfId();
          },
          error: (String response) {
            SnackBarDialog.instance.show(ApiConfig.ERROR, response);
          },
          isProgressShow: false,
          params: {});

      initPlatformState();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
