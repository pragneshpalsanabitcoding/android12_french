import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../dialogs/views/update_app_dialog.dart';
import '../../welcome/controllers/welcome_controller.dart';

class HomeController extends GetxController {
  static HomeController to = Get.put(HomeController());

//TODO: Implement HomeController

  bool _isUnderstood = false;
  bool _isFirstTime = false;

  @override
  void onClose() {
    print("On Close Home controller");
  }

  int versionCode = 1;

  @override
  Future<void> onInit() async {
// TODO: implement onInit
    super.onInit();
    isFirstTime = GetStorage().read("is_first_time") ?? true;
    isUnderstood = GetStorage().read("is_understood") ?? false;
  }

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
                  .appUpdate.isPopupDialog ==
              true
          ? Future.delayed(const Duration(seconds: 0), () {
              updateDailog();
            })
          : Container();
    }
  }

  @override
  void onReady() {
// TODO: implement onReady
    super.onReady();
    checkConnection();
  }

  bool get isFirstTime => _isFirstTime;

  set isFirstTime(bool value) {
    _isFirstTime = value;
    GetStorage().write("is_first_time", _isFirstTime);
  }

  bool get isUnderstood => _isUnderstood;

  set isUnderstood(bool value) {
    _isUnderstood = value;
    GetStorage().write("is_understood", _isUnderstood);
  }
}
