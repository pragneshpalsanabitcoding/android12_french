import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uk_video_call/app/common/views/menu_panel_widget_view.dart';
import 'package:uk_video_call/app/dialogs/snackbar_dialog.dart';
import 'package:uk_video_call/app/modules/dial_call/controllers/dial_call_controller.dart';
import 'package:uk_video_call/app/modules/home/views/home_view.dart';
import 'package:uk_video_call/app/modules/welcome/controllers/welcome_controller.dart';

import '../../../adssss.dart';
import '../../../common/views/button_widget_view.dart';
import '../../../constants/api_config.dart';
import '../../../constants/asset_config.dart';
import '../../../constants/color_config.dart';
import '../../../dialogs/views/update_app_dialog.dart';
import '../../../routes/app_pages.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/end_call_controller.dart';

class EndCallView extends GetView<EndCallController> {
  EndCallView({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addPostFrameCallback((_) => initialization());
  }

  Future<void> initialization() async {
    EndCallController.to.behaviourGroup.value = "Incorrect Information";
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${(duration.inHours > 0) ? twoDigits(duration.inHours) + ":" : ""}$twoDigitMinutes:$twoDigitSeconds";
  }

  popupDialougRewared() {
    final dateList =
        printDuration(Duration(seconds: DialCallController.to.timerCount.value))
            .split(":");

    var isReewarded = int.parse(dateList[0]) > 0 ||
        int.parse(dateList[1]) >
                WelcomeController
                    .to
                    .settingsModel!
                    .comMinichatJolieVideochatDirect
                    .adSetting
                    .secondsRequireTrigerReward &&
            WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
                .adsSequence.isNotEmpty;

    if (isReewarded == true) {
      EndCallController.to.isRewaredAdsShow.value = true;
    } else {
      EndCallController.to.isRewaredAdsShow.value = false;
    }

    var aaa = dateList[1];

    if (int.parse(aaa) >=
        WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
            .adSetting.secondsRequireTrigerReward) {}
  }

  void showSpamUserSheet(Map opponentUser) {
    List<String> behaviorsList = [
      "Incorrect Information",
      "Sexual Content",
      "Harassment or repulsive language",
      "Unreasonable Demands"
    ];

    EndCallController.to.behaviourGroup.value = "Incorrect Information";

    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: ColorConfig.WHITE_COLOR),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              "Reports Behaviour",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: ColorConfig.WHITE_COLOR,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: behaviorsList.length,
                itemBuilder: (context, index) {
                  return Obx(() => RadioListTile<String>(
                        title: Text(
                          behaviorsList[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        activeColor: ColorConfig.ACCENT_COLOR,
                        value: behaviorsList[index],
                        groupValue: EndCallController.to.behaviourGroup.value,
                        onChanged: (value) {
                          EndCallController.to.behaviourGroup.value =
                              value ?? "Incorrect Information";
                        },
                      ));
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ButtonWidgetView(
                      color: ColorConfig.PRIMARY_COLOR,
                      width: 150.0.w,
                      height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      fontSize: 15.sp,
                      title: "CANCEL".tr,
                      fontColor: Colors.white,
                      callback: () async {
                        Get.back();
                      },
                    ),
                    // SizedBox(width: 30.h,),
                    ButtonWidgetView(
                      width: 150.0.w,
                      height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      fontSize: 15.sp,
                      title: "REPORT".tr,
                      color: ColorConfig.BUTTON_COLOR,
                      fontColor: ColorConfig.WHITE_COLOR,
                      callback: () async {
                        Get.back();
                        ProfileController.to
                            .saveSpamUserIds(opponentUser["uid"]);
                        SnackBarDialog.instance.show(ApiConfig.SUCCESS,
                            "Your request submitted successfully.");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(HomeView());
        return false;
      },
      child: Scaffold(
          backgroundColor: ColorConfig.PRIMARY_COLOR,
          bottomNavigationBar: WelcomeController.to.settingsModel!
                      .comMinichatJolieVideochatDirect.adsSequence.isNotEmpty ==
                  true
              ? BottomAppBar(
                  child: bannerAds(),
                )
              : Container(
                  height: 0,
                ),
          extendBodyBehindAppBar: true,
          // appBar: AppBar(
          //   iconTheme: const IconThemeData(
          //     color: Colors.black, //change your color here
          //   ),
          //   backgroundColor: Colors.transparent,
          //   elevation: 0.0,
          //   actions: [
          //     IconButton(
          //       icon: const Icon(
          //         Icons.flag,
          //         color: Colors.black,
          //       ),
          //       tooltip: "Report",
          //       onPressed: () async {
          //         showSpamUserSheet(Get.arguments);
          //         showIntraAds();
          //       },
          //     )
          //   ],
          // ),
          body: Stack(
            children: [
              Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(10.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.off(HomeView());
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 40.w),
                              child: Row(
                                children: [
                                  Text(
                                    "Jolie",
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
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.flag,
                                color: Colors.white,
                              ),
                              tooltip: "Report",
                              onPressed: () async {
                                showSpamUserSheet(Get.arguments);
                                showIntraAds();
                              },
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 0.h,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 80.h),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  children: [
                    WelcomeController
                            .to
                            .settingsModel!
                            .comMinichatJolieVideochatDirect
                            .adsSequence
                            .isNotEmpty
                        ? SafeArea(child: mediumNativeAds())
                        : Container(
                            color: ColorConfig.PRIMARY_COLOR,
                            alignment: Alignment.bottomCenter,
                            width: MediaQuery.of(context).size.width,
                            child: SafeArea(
                              child: Image(
                                image: AssetConfig.IC_CARTOON,
                              ),
                            ),
                          ),
                    Spacer(),
                    SizedBox(
                      // width: double.infinity,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // const Spacer(),
                          Text(
                            "You Have Disconnected \nThe Call".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: const Color(0xff006BCD)),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp)),
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child:
                                DialCallController.to.opponentUser!["name"] ==
                                        ""
                                    ? const Text("No Name")
                                    : Text(
                                        "${DialCallController.to.opponentUser!["name"]}",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          Text(
                            "CALL DURATION".tr,
                            style: TextStyle(
                                fontSize: 15.sp,
                                color:
                                    const Color(0xff000000).withOpacity(0.63)),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp)),
                              color: ColorConfig.BLACK,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              printDuration(Duration(
                                  seconds:
                                      DialCallController.to.timerCount.value)),
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: ColorConfig.WHITE_COLOR,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ButtonWidgetView(
                            color: ColorConfig.BUTTON_COLOR,
                            height: 55.h,
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            margin: EdgeInsets.symmetric(horizontal: 50.w),
                            fontSize: 18.sp,
                            icon: Icon(Icons.arrow_forward,
                                color: ColorConfig.WHITE_COLOR),
                            title: "CALL AGAIN".tr,
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
                                  if (EndCallController
                                          .to.isRewaredAdsShow.value ==
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
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
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    Colors.grey,
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
                                                                    .withOpacity(
                                                                        0.09)),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.h),
                                                            width: 1000.w,
                                                            margin:
                                                                EdgeInsets.only(
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
                                                                  fontSize:
                                                                      18.w,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20.h,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                              showRewardAds(
                                                                  callback:
                                                                      () => {
                                                                            Get.offNamed(Routes.DIAL_CALL)
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
                                                                        blurRadius:
                                                                            8.0,
                                                                        offset: const Offset(
                                                                            0,
                                                                            10))
                                                                  ],
                                                                  borderRadius: const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10)),
                                                                  color: ColorConfig
                                                                      .BLACK_COLOR),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          40.w,
                                                                      vertical:
                                                                          15.h),
                                                              child: Text(
                                                                "Watch Ad",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20.w),
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
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.h),
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
                                                                color: Colors
                                                                    .black,
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
                            height: 40.h,
                          ),
                          const MenuPanelWidgetView(),
                          SizedBox(
                            height: 40.h,
                          ),
                          // BcsAdsManager.showBannerAds(),
                          // AdsManager.instance.getBannerAds(true)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
