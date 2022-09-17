import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_string/random_string.dart';

import '../../welcome/controllers/welcome_controller.dart';

enum GenderType { MALE, FEMALE }

class ProfileController extends GetxController {
  static ProfileController to = Get.put(ProfileController());

  //TODO: Implement ProfileController
  RxBool checkPermissionCamera = false.obs;
  RxBool checkPermissionMicro = false.obs;
  RxString selfId = "".obs;
  RxString name = "".obs;
  Rx<GenderType> gender = GenderType.MALE.obs;
  RxInt age = 18.obs;
  RxInt level = 4.obs;
  List<String> _spamUserIds = [];

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  @override
  Future<void> onInit() async {}

  loadData() {
    name.value = GetStorage().read("name") ?? "";
    gender.value = (GetStorage().read("gender") == null
        ? GenderType.MALE
        : GenderType.values.firstWhere(
            (e) => e.toString().contains(GetStorage().read("gender"))));
    age.value = GetStorage().read("age") ?? 0;
    level.value = GetStorage().read("level") ?? 4;
    _spamUserIds = GetStorage().read("blockedUserIds") == null
        ? []
        : json.decode(GetStorage().read("blockedUserIds")).cast<String>();
  }

  /// It will use to save profile in storage.
  saveProfile() {
    GetStorage().write("name", name.value);
    GetStorage().write("gender", gender.value.name);
    GetStorage().write("age", age.value);
    GetStorage().write("level", level.value);
  }

  /// It will get blocked user ids.
  List<String> getSpamUserIds() {
    return _spamUserIds;
  }

  /// It will save blocked ids
  saveSpamUserIds(String id) {
    if (!_spamUserIds.contains(id)) {
      _spamUserIds.add(id);
      GetStorage().write("blockedUserIds", json.encode(_spamUserIds));
    }
  }

  permissionDialoug(BuildContext context) async {
    if (await Permission.microphone.status ==
        PermissionStatus.permanentlyDenied ||
        await Permission.microphone.status == PermissionStatus.denied) {
      showDialog(
          barrierDismissible: false,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) => WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: Dialog(
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: SizedBox(
                      height: 270.h,
                      width: 700.w,
                      child: Stack(
                        children: [
                          Positioned(
                              right: 0,
                              child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(10.h),
                                      child: const Icon(Icons.close)))),
                          Padding(
                            padding: EdgeInsets.all(15.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    "Allow Permission",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.w),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Center(
                                  child: Text(
                                    "Allow Access to  the following permission for better services",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15.w),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  margin: EdgeInsets.all(2.h),
                                  padding: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      border: Border.all(color: Colors.grey)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons_new/12.png",
                                        height: 27.h,
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(
                                        "Camera",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17.w),
                                      ),
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Obx(() =>
                                      checkPermissionCamera.value == true
                                          ? const Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      )
                                          : const Icon(
                                        Icons.done,
                                        color: Colors.transparent,
                                      ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  margin: EdgeInsets.all(2.h),
                                  padding: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      border: Border.all(color: Colors.grey)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons_new/11.png",
                                        height: 27.h,
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(
                                        "Microphone",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17.w),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Obx(() =>
                                      checkPermissionMicro.value == true
                                          ? const Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      )
                                          : const Icon(
                                        Icons.done,
                                        color: Colors.transparent,
                                      ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (checkPermissionMicro.value == true &&
                                        checkPermissionCamera.value == true) {
                                      Get.back();
                                    } else {
                                      await Permission.camera.request();
                                      if (await Permission.camera.status ==
                                          PermissionStatus.granted) {
                                        checkPermissionCamera.value = true;
                                      }
                                      await Permission.microphone.request();

                                      if (await Permission.microphone.status ==
                                          PermissionStatus.granted) {
                                        checkPermissionMicro.value = true;
                                      }
                                    }
                                  },
                                  child: Container(
                                      height: 40.h,
                                      margin: EdgeInsets.all(2.h),
                                      padding: EdgeInsets.all(8.h),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Obx(() =>
                                      checkPermissionMicro.value == true &&
                                          checkPermissionCamera.value ==
                                              true
                                          ? const Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Colors.white),
                                      )
                                          : const Text(
                                        "CLICK TO ALLOW",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ))),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          context: context);
    }
  }

  /// it will use to setup self ID initially
  Future setupSelfId() async {
    if (WelcomeController.to.appDataModel.appData.isRandomSelfId) {
      selfId.value = randomNumeric(30);
    } else {
      try {
        if (Platform.isAndroid) {
          AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
          selfId.value =
              androidInfo.fingerprint!.replaceAll(RegExp(r'[^\w\s]+'), '');
        } else if (Platform.isIOS) {
          IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
          selfId.value = iosInfo.identifierForVendor!;
        }
      } on PlatformException {
        selfId.value = randomNumeric(30);
      }
    }
  }
}
