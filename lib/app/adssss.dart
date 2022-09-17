import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_applovin_unity_ads/google_applovin_unity_ads.dart';
import 'package:google_applovin_unity_ads/native/controller.dart';

import 'dialogs/views/update_app_dialog.dart';
import 'modules/welcome/controllers/welcome_controller.dart';

showIntraAds({Function? callback}) async {
  if (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
          .adSetting.appVersionCode ==
      versionCode) {
    if (callback != null) {
      callback();
    }
  } else {
    GoogleApplovinUnityAds.showIntraAds(callback: callback);
  }
}

Future<void> showRewardAds({Function? callback}) async {
  if (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
          .adSetting.appVersionCode ==
      versionCode) {
    print("check callback 11111111");
    if (callback != null) {
      callback();
    }
  } else {
    print("check callback 222222222");
    GoogleApplovinUnityAds.showRewardAds(callback: callback);
  }
}

bannerAds() {
  if (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
              .adSetting.appVersionCode ==
          versionCode ||
      WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
          .adsSequence.isEmpty) {
    return Container(
      height: 0,
    );
  }

  return GoogleApplovinUnityAds.bannerAds();
}

fullNativeAds() {
  if (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
              .adSetting.appVersionCode ==
          versionCode ||
      WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
          .adsSequence.isEmpty ||
      (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
                  .adsSequence.length ==
              1 &&
          WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
                  .adsSequence[0] ==
              "custom_ads")) {
    return Container(
      height: 0,
    );
  }
  return GoogleApplovinUnityAds.nativeAds(
      NativeSize(Size(double.infinity, 350.h)), "F",
      error: Container(
        height: 0,
      ));
}

mediumNativeAds() {
  if (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
              .adSetting.appVersionCode ==
          versionCode ||
      WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
          .adsSequence.isEmpty ||
      (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
                  .adsSequence.length ==
              1 &&
          WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
                  .adsSequence[0] ==
              "custom_ads")) {
    return Container(
      height: 0,
    );
  }
  return GoogleApplovinUnityAds.nativeAds(
      NativeSize(Size(double.infinity, 170.h)), "M");
}

showOpenAd() {
  if (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
              .adSetting.appVersionCode ==
          versionCode ||
      WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
          .adsSequence.isEmpty) {
    return;
  }

  GoogleApplovinUnityAds.showOpenAds();
}

smallNativeAds() {
  if (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
              .adSetting.appVersionCode ==
          versionCode ||
      WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
          .adsSequence.isEmpty ||
      (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
                  .adsSequence.length ==
              1 &&
          WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
                  .adsSequence[0] ==
              "custom_ads")) {
    return Container(
      height: 0,
    );
  }
  return GoogleApplovinUnityAds.nativeAds(
      NativeSize(Size(double.infinity, 16.h)), "S");
}

IsFullAds() {
  WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect.adSetting
              .isFullAds ==
          true
      ? showIntraAds()
      : Container();
}
// abstract class for Open Ad

abstract class OpenAdState<T extends GetxController> extends GetView<T>
    with WidgetsBindingObserver {

  OpenAdState({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addPostFrameCallback((_) => initialization());
  }

  Future<void> initialization({BuildContext? context}) async {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("Yes yes Open Adddddddsss  $state");
    if (state == AppLifecycleState.resumed) {
      print("Yes yes Open Adddddddsss  $state 121212");
      if (!WelcomeController.to.isAdShow.value) {
        print("Yes yes Open Adddddddsss  $state 2323232323");
        WelcomeController.to.isAdShow.value = true;
        GoogleApplovinUnityAds.showOpenAds();
      }
    }

    if (state == AppLifecycleState.paused) {
      print("Yes yes Open Adddddddsss  $state 4545454545454");
      WelcomeController.to.isAdShow.value = false;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
