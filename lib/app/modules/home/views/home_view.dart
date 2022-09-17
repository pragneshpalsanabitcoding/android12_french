import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uk_video_call/app/constants/asset_config.dart';
import 'package:uk_video_call/app/constants/color_config.dart';
import 'package:uk_video_call/app/dialogs/views/rate_dialog.dart';
import 'package:uk_video_call/app/modules/language_selection/language_select.dart';
import 'package:uk_video_call/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:uk_video_call/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../adssss.dart';
import '../../../common/views/button_widget_view.dart';
import '../../../common/views/menu_panel_widget_view.dart';
import '../../../dialogs/views/about_us_dialog.dart';
import '../../../dialogs/views/update_app_dialog.dart';
import '../../end_call/controllers/end_call_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  HomeView({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addPostFrameCallback((_) => initialization());
  }

  var getLangu;

  Future<void> initialization() async {
    ProfileController.to.permissionDialoug(Get.context!);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    getLangu = preferences.getBool("language");

    if (HomeController.to.isFirstTime) {
      showDisclaimer();
    }
  }

  void showDisclaimer() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
        color: ColorConfig.WHITE_COLOR,
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp)),
                color: ColorConfig.PRIMARY_COLOR),
            child: Text(
              "Terms & Conditions".tr,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: ColorConfig.WHITE_COLOR,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Please be consider so that everyone has a good time here."
                              .tr,
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                            "Remember that there are 3 rules strictly forbidden"
                                .tr,
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                            "⦿  Abusive words, language or profanity violence behaviour of any kind..."
                                .tr,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text("⦿  Don't show image content nudity or sexual.".tr,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                            "⦿  Don't show tobacco, alcohol, drugs material."
                                .tr,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: (!HomeController.to.isFirstTime)
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      ButtonWidgetView(
                        color: ColorConfig.BUTTON_COLOR,
                        width: 160.0.w,
                        height: 45.h,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        fontSize: 15.sp,
                        title: "I UNDERSTAND".tr,
                        fontColor: Colors.white,
                        callback: () async {
                          HomeController.to.isUnderstood = true;
                          HomeController.to.isFirstTime = false;
                          Get.back();
                        },
                      ),
                      (!HomeController.to.isFirstTime)
                          ? ButtonWidgetView(
                              width: 150.0.w,
                              height: 45.h,
                              // margin: EdgeInsets.only(left: 20.w),
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              fontSize: 15.sp,
                              title: "CLOSE".tr,
                              color: ColorConfig.BLACK,
                              fontColor: ColorConfig.WHITE_COLOR,
                              callback: () async {
                                HomeController.to.isUnderstood = false;
                                Get.back();
                              },
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (ctx) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.h),
                        topRight: Radius.circular(25.h))),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 10.h),
                  Text(
                      WelcomeController
                          .to
                          .settingsModel!
                          .comMinichatJolieVideochatDirect
                          .exitDialog
                          .exitTitle
                          .tr,
                      style: TextStyle(
                          fontSize: 25.w, fontWeight: FontWeight.bold)),
                  SizedBox(height: 7.h),
                  Text(
                    WelcomeController
                        .to
                        .settingsModel!
                        .comMinichatJolieVideochatDirect
                        .exitDialog
                        .exitMessage
                        .tr,
                    style: TextStyle(fontSize: 15.w),
                  ),
                  SizedBox(height: 1.h),
                  mediumNativeAds(),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.back();
                            Share.share(WelcomeController
                                .to
                                .settingsModel!
                                .comMinichatJolieVideochatDirect
                                .shareApp
                                .shareTitle);
                          },
                          child: Icon(
                            Icons.share,
                            size: 30.w,
                          )),
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.back();
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => RatingDialog(
                                      image: Image.asset(
                                        "assets/icons_new/brazil logo.png",
                                        height: 115.h,
                                        width: 115.w,
                                      ),
                                      initialRating: 5.0,
                                      title: Text(
                                        WelcomeController
                                            .to
                                            .settingsModel!
                                            .comMinichatJolieVideochatDirect
                                            .rateApp
                                            .rateMessage,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // encourage your user to leave a high rating?
                                      message: Text(
                                        WelcomeController
                                            .to
                                            .settingsModel!
                                            .comMinichatJolieVideochatDirect
                                            .rateApp
                                            .rateMessage,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      // your app's logo?
                                      submitButtonText: 'Submit',
                                      onCancelled: () {},
                                      onSubmitted: (response) {
                                        // TODO: add your own logic
                                        if (response.rating <= 2.0) {
                                          MotionToast.success(
                                            title: const Text(
                                                "Thanks For Your Rating"),
                                            description: const Text(
                                                "We Will Improve App"),
                                            width: 300,
                                            height: 80,
                                          ).show(context);
                                        } else {
                                          launch(WelcomeController
                                              .to
                                              .settingsModel!
                                              .comMinichatJolieVideochatDirect
                                              .rateApp
                                              .rateAppUrl);
                                        }
                                      },
                                      starSize: 30,
                                    ));
                          },
                          child: Icon(
                            Icons.star,
                            size: 30.w,
                          )),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            exit(0);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.h),
                            alignment: Alignment.center,
                            width: 40.w,
                            height: 40.h,
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.h),
                            alignment: Alignment.center,
                            width: 40.w,
                            height: 40.h,
                            decoration: const BoxDecoration(
                                color: Color(0xffffe234),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Text(
                              "No",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              );
            });
        return false;
      },
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: ColorConfig.PRIMARY_COLOR,
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons_new/loca1.png"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Image.asset(
                      AssetConfig.APP_LOGO_BIG,
                      height: 120.h,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    height: 0,
                  ),
                  drawerMenu("Profile".tr, () {
                    showIntraAds();
                    Future.delayed(const Duration(seconds: 0), () {
                      Get.to(ProfileView());
                    });
                  }, "", "assets/drawer/profile.png"),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    height: 0,
                  ),
                  drawerMenu("Language".tr, () {
                    showIntraAds();
                    Future.delayed(const Duration(seconds: 0), () {
                      Get.to(const LanguageSelection());
                    });
                  }, "", "assets/drawer/language.png"),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    height: 0,
                  ),
                  drawerMenu("Privacy Policy".tr, () {
                    launch(WelcomeController
                        .to
                        .settingsModel!
                        .comMinichatJolieVideochatDirect
                        .privacyPolicy
                        .privacyPolicy);
                  }, "", "assets/drawer/privacy.png"),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    height: 0,
                  ),
                  drawerMenu("Share App".tr, () {
                    Future.delayed(const Duration(seconds: 0), () {
                      Share.share(WelcomeController.to.settingsModel!
                          .comMinichatJolieVideochatDirect.shareApp.shareTitle);
                    });
                  }, "", "assets/drawer/share.png"),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    height: 0,
                  ),
                  drawerMenu("Rate us".tr, () {
                    Future.delayed(const Duration(seconds: 0), () {
                      rateDailog(context);
                    });
                  }, "", "assets/drawer/rate.png"),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    height: 0,
                  ),
                  drawerMenu("More Apps".tr, () {
                    launch(WelcomeController.to.settingsModel!
                        .comMinichatJolieVideochatDirect.moreAppUrl);
                  }, "(Ad)", "assets/drawer/more app.png"),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    height: 0,
                  ),
                  drawerMenu("Terms & Conditions".tr, () {
                    showIntraAds();

                    Future.delayed(const Duration(seconds: 0), () {
                      showDisclaimer();
                    });
                  }, "", "assets/drawer/terms.png"),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    height: 0,
                  ),
                  drawerMenu("Feedback".tr, () {
                    launch(
                        "${WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect.feedbackSupport.emailId}?subject=${WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect.feedbackSupport.emailSubject}&body=${WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect.feedbackSupport.emailMessage}");
                  }, "", "assets/drawer/feedback.png"),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    height: 0,
                  ),
                  drawerMenu("About Us".tr, () {
                    Future.delayed(const Duration(seconds: 0), () {
                      showIntraAds();
                      showAboutUs(context);
                    });
                  }, "", "assets/drawer/about.png"),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    height: 0,
                  ),
                  drawerMenu("Exit".tr, () {
                    Future.delayed(const Duration(seconds: 0), () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (ctx) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25.h),
                                      topRight: Radius.circular(25.h))),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 10.h),
                                    Text(
                                        WelcomeController
                                            .to
                                            .settingsModel!
                                            .comMinichatJolieVideochatDirect
                                            .exitDialog
                                            .exitTitle
                                            .tr,
                                        style: TextStyle(
                                            fontSize: 25.w,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 7.h),
                                    Text(
                                      WelcomeController
                                          .to
                                          .settingsModel!
                                          .comMinichatJolieVideochatDirect
                                          .exitDialog
                                          .exitMessage
                                          .tr,
                                      style: TextStyle(fontSize: 15.w),
                                    ),
                                    SizedBox(height: 1.h),
                                    mediumNativeAds(),
                                    SizedBox(height: 5.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              Get.back();
                                              Share.share(WelcomeController
                                                  .to
                                                  .settingsModel!
                                                  .comMinichatJolieVideochatDirect
                                                  .shareApp
                                                  .shareTitle);
                                            },
                                            child: Icon(
                                              Icons.share,
                                              size: 30.w,
                                            )),
                                        InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              Get.back();
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder: (context) =>
                                                      RatingDialog(
                                                        image: Image.asset(
                                                          "assets/icons_new/brazil logo.png",
                                                          height: 115.h,
                                                          width: 115.w,
                                                        ),
                                                        initialRating: 5.0,
                                                        title: Text(
                                                          WelcomeController
                                                              .to
                                                              .settingsModel!
                                                              .comMinichatJolieVideochatDirect
                                                              .rateApp
                                                              .rateMessage,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        // encourage your user to leave a high rating?
                                                        message: Text(
                                                          WelcomeController
                                                              .to
                                                              .settingsModel!
                                                              .comMinichatJolieVideochatDirect
                                                              .rateApp
                                                              .rateMessage,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 15),
                                                        ),
                                                        // your app's logo?
                                                        submitButtonText:
                                                            'Submit',
                                                        onCancelled: () {},
                                                        onSubmitted:
                                                            (response) {
                                                          // TODO: add your own logic
                                                          if (response.rating <=
                                                              2.0) {
                                                            MotionToast.success(
                                                              title: const Text(
                                                                  "Thanks For Your Rating"),
                                                              description:
                                                                  const Text(
                                                                      "We Will Improve App"),
                                                              width: 300,
                                                              height: 80,
                                                            ).show(context);
                                                          } else {
                                                            launch(WelcomeController
                                                                .to
                                                                .settingsModel!
                                                                .comMinichatJolieVideochatDirect
                                                                .rateApp
                                                                .rateAppUrl);
                                                          }
                                                        },
                                                        starSize: 30,
                                                      ));
                                            },
                                            child: Icon(
                                              Icons.star,
                                              size: 30.w,
                                            )),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              exit(0);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10.h),
                                              alignment: Alignment.center,
                                              width: 40.w,
                                              height: 40.h,
                                              decoration: const BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: const Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10.h),
                                              alignment: Alignment.center,
                                              width: 40.w,
                                              height: 40.h,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xffffe234),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: const Text(
                                                "No",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            );
                          });
                    });
                  }, "", "assets/drawer/exit.png"),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: ColorConfig.PRIMARY_COLOR,
        bottomNavigationBar: WelcomeController.to.settingsModel!
                    .comMinichatJolieVideochatDirect.adsSequence.isNotEmpty ==
                true
            ? BottomAppBar(child: bannerAds())
            : Container(height: 0),
        body: Stack(
          children: [
            AppBar(backgroundColor: ColorConfig.PRIMARY_COLOR),
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SafeArea(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "  Jolie",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.w,
                                  color: ColorConfig.WHITE_COLOR),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Image.asset(
                              "assets/icons_new/logo.png",
                              height: 40.h,
                            )
                          ],
                        )
                      ]),
                ),
                SizedBox(
                  height: 0.h,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 80.h),
              decoration: BoxDecoration(
                color: ColorConfig.WHITE_COLOR,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Image(
                    image: AssetConfig.IC_CARTOON,
                    height: 240.h,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ButtonWidgetView(
                    color: ColorConfig.BUTTON_COLOR,
                    height: 55.h,
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    margin: EdgeInsets.symmetric(horizontal: 50.w),
                    fontSize: getLangu == true ? 16.sp : 18.sp,
                    icon: Icon(Icons.arrow_forward,
                        color: ColorConfig.WHITE_COLOR),
                    title: "START VIDEO CALL".tr,
                    callback: () async {
                      if (WelcomeController
                          .to
                          .settingsModel!
                          .comMinichatJolieVideochatDirect
                          .adsSequence
                          .isNotEmpty) {
                        if (WelcomeController
                                .to
                                .settingsModel!
                                .comMinichatJolieVideochatDirect
                                .adSetting
                                .appVersionCode !=
                            versionCode) {
                          if (EndCallController.to.isRewaredAdsShow.value ==
                              true) {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (a) {
                                  return WillPopScope(
                                    onWillPop: () async {
                                      return false;
                                    },
                                    child: SimpleDialog(
                                      backgroundColor: Colors.transparent,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  color: Colors.white),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 15.h,
                                                  ),
                                                  Text(
                                                    "Reward Ad",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey,
                                                        fontSize: 25.w),
                                                  ),
                                                  SizedBox(
                                                    height: 30.h,
                                                  ),
                                                  Image.asset(
                                                    "assets/icons_new/popup_rewared.png",
                                                    height: 140.h,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: const Color(
                                                                0xff000000)
                                                            .withOpacity(0.09)),
                                                    padding:
                                                        EdgeInsets.all(5.h),
                                                    width: 1000.w,
                                                    margin: EdgeInsets.only(
                                                        left: 30.w,
                                                        right: 30.w,
                                                        top: 20.h),
                                                    child: Text(
                                                      WelcomeController
                                                          .to
                                                          .settingsModel!
                                                          .comMinichatJolieVideochatDirect
                                                          .rewardDialog
                                                          .rewardMessage,
                                                      style: TextStyle(
                                                          fontSize: 18.w,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      showRewardAds(
                                                          callback: () => {
                                                                Get.offNamed(Routes
                                                                    .DIAL_CALL)
                                                              });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: ColorConfig
                                                                    .BLACK_COLOR
                                                                    .withOpacity(
                                                                        0.20),
                                                                blurRadius: 8.0,
                                                                offset:
                                                                    const Offset(
                                                                        0, 10))
                                                          ],
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          color: ColorConfig
                                                              .BLACK_COLOR),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 40.w,
                                                              vertical: 15.h),
                                                      child: Text(
                                                        "Watch Ad",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.w),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.h),
                                                  child: InkWell(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                                  0xffFFFFFF)
                                                              .withOpacity(
                                                                  0.14)),
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 30.w,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            Get.offNamed(Routes.DIAL_CALL);
                          }
                        } else {
                          Get.offNamed(Routes.DIAL_CALL);
                        }
                      } else {
                        Get.offNamed(Routes.DIAL_CALL);
                      }
                    },
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  const Spacer(),
                  const MenuPanelWidgetView(),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void launchURL(String? url) async {
  if (!await launchUrl(Uri.parse(url ?? ""))) {}
}

PopupMenuItem _buildPopupMenuItem(
    String title, VoidCallback? tapEvent, var ad, String? image) {
  return PopupMenuItem(
    onTap: tapEvent,
    child: Stack(children: [
      Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "$image",
              color: Colors.black,
              height: 25.h,
              width: 50.w,
            ),
            SizedBox(
              width: 15.w,
            ),
            Padding(padding: EdgeInsets.only(top: 5.h), child: Text(title)),
            SizedBox(
              width: 5.w,
            ),
            Container(
              // decoration: const BoxDecoration(
              //   color: Colors.orange,
              //   borderRadius: BorderRadius.all(Radius.circular(0)),
              // ),
              child: Text(
                "$ad",
                style: TextStyle(fontSize: 12.w, color: Colors.grey),
              ),
            )
          ]),
    ]),
  );
}

drawerMenu(String title, VoidCallback? tapEvent, var ad, String? image) {
  return PopupMenuItem(
    onTap: tapEvent,
    child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Image.asset(
        "$image",
        color: Colors.white,
        height: 25.h,
        width: 50.w,
      ),
      SizedBox(
        width: 15.w,
      ),
      Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          )),
      SizedBox(
        width: 5.w,
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 5.h),
        child: Text(
          "$ad",
          style: TextStyle(fontSize: 12.w, color: Colors.white),
        ),
      )
    ]),
  );
}
