// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// class ExitDialogView extends GetView
// {
//   const ExitDialogView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return AlertDialog(
//       title: const Text('Exit'),
//       content: const Text('Do you like to exit from app?'),
//       actions: [
//         TextButton(onPressed: () async {
//           Get.back(result: true);
//         }, child: const Text("Yes")),
//         TextButton(onPressed: () async {
//           Get.back(result: false);
//         }, child: const Text("No"))
//       ],
//     );
//
//   }
// }
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:uk_video_call/app/constants/color_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uk_video_call/app/dialogs/views/rate_dialog.dart';
import 'package:uk_video_call/app/modules/welcome/controllers/welcome_controller.dart';

exitDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.BOTTOMSLIDE,
    headerAnimationLoop: true,
    dialogType: DialogType.WARNING,
    btnOk: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {
                  Get.back();
                  Share.share(WelcomeController.to.settingsModel!
                      .comMinichatJolieVideochatDirect.shareApp.shareTitle);
                },
                child: Icon(
                  Icons.share,
                  size: 35.w,
                )),
            InkWell(
                onTap: () {
                  Get.back();
                  rateDailog(context);
                },
                child: Icon(
                  Icons.star,
                  size: 35.w,
                )),
          ],
        ),
        const Divider(),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  exit(0);
                },
                child: Container(
                  margin: EdgeInsets.all(1.h),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.h),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    "Yes".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.w),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.all(1.h),
                  padding: EdgeInsets.all(10.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorConfig.PRIMARY_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    "No".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.w),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    showCloseIcon: false,
    title: WelcomeController
        .to.settingsModel!.comMinichatJolieVideochatDirect.exitDialog.exitTitle.tr,
    desc: WelcomeController
        .to.settingsModel!.comMinichatJolieVideochatDirect.exitDialog.exitMessage.tr,
    titleTextStyle: TextStyle(fontSize: 20.w, fontWeight: FontWeight.bold),
  ).show();
}
