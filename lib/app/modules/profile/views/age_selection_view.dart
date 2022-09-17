import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../adssss.dart';
import '../../../common/views/button_widget_view.dart';
import '../../../constants/asset_config.dart';
import '../../../constants/color_config.dart';
import '../../../routes/app_pages.dart';
import '../../welcome/controllers/welcome_controller.dart';
import '../controllers/profile_controller.dart';

class AgeSelectionView extends GetView {
  const AgeSelectionView({Key? key}) : super(key: key);

  saveProfile() {
    ProfileController.to.saveProfile();
    Get.offNamed(Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
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
          body: Stack(
            children: [
              Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(10.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Jolie",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.w,
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
                    Container(
                        decoration:
                            BoxDecoration(color: ColorConfig.WHITE_COLOR),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Select Your Age".tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 0.h,
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 120.w,
                                    height: 100.h,
                                    // padding: EdgeInsets.symmetric(vertical: 5.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          // height: 50.h,
                                          alignment: Alignment.center,
                                          child: Image(
                                            image: (ProfileController
                                                        .to.gender.value ==
                                                    GenderType.MALE)
                                                ? AssetConfig.IC_MALE
                                                : AssetConfig.IC_FEMALE,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                            // width: 35.sp,
                                            height: 80.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    // padding: EdgeInsets.only(left: 10.h),
                                    child: Text(
                                      ProfileController.to.gender.value ==
                                              GenderType.MALE
                                          ? "MALE".tr
                                          : "FEMALE".tr,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Obx(() {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffEE1C25).withOpacity(0.12),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: ColorConfig.AGE_BORDER),
                                    ),
                                    height: 50.h,
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          accentColor:
                                              ColorConfig.PRIMARY_COLOR,
                                          textTheme: Theme.of(context)
                                              .textTheme
                                              .copyWith()),
                                      child: NumberPicker(
                                          axis: Axis.horizontal,
                                          itemWidth: 70,
                                          value: (ProfileController
                                                      .to.age.value ==
                                                  0)
                                              ? 18
                                              : ProfileController.to.age.value,
                                          zeroPad: true,
                                          haptics: true,
                                          itemCount: 3,
                                          minValue: 18,
                                          maxValue: 99,
                                          onChanged: (newValue) {
                                            ProfileController.to.age.value =
                                                newValue;
                                          }),
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(
                                height: 20.h,
                              ),
                              Obx(() {
                                return Text(
                                  "${ProfileController.to.name.value}'s ${"age".tr} ${(ProfileController.to.age.value == 0) ? 18 : ProfileController.to.age.value}"
                                      .tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorConfig.GREY,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                );
                              }),
                              SizedBox(
                                height: 10.h,
                              ),
                              ButtonWidgetView(
                                color: ColorConfig.BUTTON_COLOR,
                                margin: EdgeInsets.symmetric(horizontal: 50.w),
                                height: 45.h,
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                fontSize: 20.sp,
                                title: "CONTINUE".tr,
                                callback: () async {
                                  ProfileController.to.age.value =
                                      (ProfileController.to.age.value == 0)
                                          ? 18
                                          : ProfileController.to.age.value;
                                  saveProfile();

                                  showIntraAds();
                                },
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              // AdsManager.instance.getBannerAds(true)
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
