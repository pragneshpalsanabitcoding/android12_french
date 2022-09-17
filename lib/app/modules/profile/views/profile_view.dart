import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uk_video_call/app/common/views/button_widget_view.dart';
import 'package:uk_video_call/app/dialogs/snackbar_dialog.dart';

import '../../../adssss.dart';
import '../../../common/views/textfield_widget_view.dart';
import '../../../constants/api_config.dart';
import '../../../constants/asset_config.dart';
import '../../../constants/color_config.dart';
import '../../../routes/app_pages.dart';
import '../../welcome/controllers/welcome_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  TextEditingController textEditingController = TextEditingController();

  ProfileView({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addPostFrameCallback((_) => initialization());
  }

  void initialization() async {
    textEditingController.text = ProfileController.to.name.value;
  }

  saveProfile() {
    if (textEditingController.text.trim().isNotEmpty) {
      ProfileController.to.name.value = textEditingController.text.trim();
      ProfileController.to.saveProfile();
      if (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
              .adSetting.isFullAds ==
          true) {
        showIntraAds();
      }
      Get.toNamed(Routes.AGE_SELECTION);
    } else {
      if (textEditingController.text.trim().isEmpty) {
        SnackBarDialog.instance
            .show(ApiConfig.ERROR, "Please enter name.".tr, color: Colors.red);
      } else {
        SnackBarDialog.instance.show(
            ApiConfig.ERROR, "Please select gender.".tr,
            color: Colors.red);
      }
    }
  }

  getGenderSelectionPanel(
      {required GenderType genderType,
      required GenderType selectedGenderType,
      required Function callback}) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            // decoration: ShapeDecoration(
            //   shape: RoundedRectangleBorder(
            //       side: BorderSide(
            //           color: (selectedGenderType == genderType)
            //               ? ColorConfig.ACCENT_COLOR
            //               : ColorConfig.ACCENT_COLOR.withOpacity(0.1),
            //           width: 1.sp),
            //       borderRadius: BorderRadius.all(Radius.circular(10.sp))),
            // ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  // height: 50.h,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Image(
                        image: (genderType == GenderType.MALE)
                            ? AssetConfig.IC_MALE
                            : AssetConfig.IC_FEMALE,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        width: 70.sp,
                        // height: 70.sp,
                      ),
                      Container(
                        width: 70.sp,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Image(
                          image: (genderType == GenderType.MALE)
                              ? AssetConfig.IC_FEMALE
                              : AssetConfig.IC_MALE,
                          fit: BoxFit.cover,
                          color: selectedGenderType == genderType
                              ? Colors.transparent
                              : Colors.black.withOpacity(0.3),
                          alignment: Alignment.center,
                          width: 70.sp,
                          // height: 70.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            genderType == GenderType.MALE ? "MALE".tr : "FEMALE".tr,
            style: TextStyle(
                fontSize: 16.sp,
                color: selectedGenderType == genderType
                    ? Colors.black
                    : Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (ProfileController.to.age.value != 0) {
            return true;
          } else {
            return false;
          }
        },
        child: Scaffold(
            backgroundColor: ColorConfig.PRIMARY_COLOR,
            bottomNavigationBar: WelcomeController
                        .to
                        .settingsModel!
                        .comMinichatJolieVideochatDirect
                        .adsSequence
                        .isNotEmpty ==
                    true
                ? BottomAppBar(
                    child: bannerAds(),
                  )
                : Container(
                    height: 0,
                  ),
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
                  child: SizedBox(
                    height: 700.h,
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
                          margin: EdgeInsets.symmetric(horizontal: 50.w),
                          child: Text(
                            "Select Gender and Enter your name".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Name".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.w),
                              )),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextFieldWidgetView(
                            controller: textEditingController,
                            hintText: "Enter your Name".tr,
                            obscureText: false,
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.left,
                            onSaved: (value) {},
                            onFieldSubmitted: (val) {
                              FocusScope.of(context).unfocus();
                            },
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return value.isEmpty
                                  ? 'Name is required.'.tr
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 50.w),
                            child: Obx(() {
                              return Row(
                                children: [
                                  Expanded(
                                    child: getGenderSelectionPanel(
                                        genderType: GenderType.MALE,
                                        selectedGenderType:
                                            ProfileController.to.gender.value,
                                        callback: () {
                                          FocusScope.of(context).unfocus();
                                          ProfileController.to.gender.value =
                                              GenderType.MALE;
                                        }),
                                  ),
                                  SizedBox(
                                    width: 20.h,
                                  ),
                                  Expanded(
                                    child: getGenderSelectionPanel(
                                        genderType: GenderType.FEMALE,
                                        selectedGenderType:
                                            ProfileController.to.gender.value,
                                        callback: () {
                                          FocusScope.of(context).unfocus();
                                          ProfileController.to.gender.value =
                                              GenderType.FEMALE;
                                        }),
                                  ),
                                ],
                              );
                            })),
                        SizedBox(
                          height: 50.h,
                        ),
                        ButtonWidgetView(
                          color: ColorConfig.BUTTON_COLOR,
                          margin: EdgeInsets.symmetric(horizontal: 50.w),
                          height: 45.h,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          fontSize: 20.sp,
                          title: "CONTINUE".tr,
                          callback: () async {
                            saveProfile();
                          },
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
