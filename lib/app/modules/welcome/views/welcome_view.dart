import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_applovin_unity_ads/google_applovin_unity_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uk_video_call/app/modules/intro_screen/intro.dart';
import 'package:uk_video_call/app/modules/profile/controllers/profile_controller.dart';

import '../../../adssss.dart';
import '../../../constants/asset_config.dart';
import '../../../constants/color_config.dart';
import '../../../routes/app_pages.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends OpenAdState<WelcomeController> {
  WelcomeView({Key? key}) : super(key: key);

  Future<void> initialization({BuildContext? context}) async {
    await WelcomeController.to.loadData();
    await ProfileController.to.loadData();
    await WelcomeController.to.initPlatformState();

    SharedPreferences pref = await SharedPreferences.getInstance();
    var introScreen = pref.getBool("intro") ?? false;
    var checkLng = await pref.getString("selectlanggg") ?? "noLng";
    if ((WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect)
        .toString()
        .isNotEmpty) {
      print("${WelcomeController
          .to.settingsModel!.comMinichatJolieVideochatDirect}");
      GoogleApplovinUnityAds.initialize(
          jsonEncode(WelcomeController
                  .to.settingsModel!.comMinichatJolieVideochatDirect)
              .toString(),
          callback: () => {
                showOpenAd(),
                if (introScreen == true &&
                    checkLng == "langDone" &&
                    ProfileController.to.age.value != 0)
                  {Get.offNamed(Routes.HOME)}
                else if (introScreen == true &&
                    checkLng == "langDone" &&
                    ProfileController.to.age.value == 0)
                  {Get.offNamed(Routes.PROFILE)}
                else
                  {Get.off(IntroScreen())}
              });
      super.initialization(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: ColorConfig.PRIMARY_COLOR,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Jolie",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.w,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(
                          "assets/icons_new/logo.png",
                          height: 40.h,
                        )
                      ]),
                ),
              ),
              Container(
                height: 1000.h,
                width: 1000.w,
                // margin: EdgeInsets.all(10.h),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80.h,
                          ),
                          Text(
                            "FREE VIDEO CALL",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Image(
                            image: AssetConfig.IC_CARTOON,
                            height: 280.h,
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          SafeArea(
                            child: SizedBox(
                              height: 130.h,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(40.sp),
                                child: Column(
                                  children: [
                                    // const Spacer(),
                                    DefaultTextStyle(
                                      textHeightBehavior:
                                          const TextHeightBehavior(
                                              applyHeightToFirstAscent: true,
                                              applyHeightToLastDescent: true),
                                      style: TextStyle(
                                        fontSize: 20.0.sp,
                                        color: ColorConfig.ACCENT_COLOR
                                            .withOpacity(0.5),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          RotateAnimatedText(
                                              '"Explore New World"',
                                              textStyle: const TextStyle(
                                                  color: Colors.black)),
                                          RotateAnimatedText(
                                              '"Find Your Special Someone"',
                                              textStyle: const TextStyle(
                                                  color: Colors.black)),
                                          RotateAnimatedText('"Start Chat"',
                                              textStyle: const TextStyle(
                                                  color: Colors.black)),
                                        ],
                                        repeatForever: true,
                                        onTap: () {
                                          print("Tap Event");
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.sp,
                            height: 20.sp,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorConfig.ACCENT_COLOR),
                              strokeWidth: 3.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
