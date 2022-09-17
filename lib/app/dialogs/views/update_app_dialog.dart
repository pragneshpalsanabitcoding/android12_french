import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/asset_config.dart';
import '../../constants/color_config.dart';
import '../../modules/welcome/controllers/welcome_controller.dart';

int versionCode = 1;

updateDailog() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var language = pref.getBool("language") ?? false;

  if ((WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
              .appUpdate.isPopupDialog ==
          true &&
      (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
                  .appUpdate.updatedVersionCode ??
              1) >
          versionCode)) {
    Get.defaultDialog(
        onWillPop: () async {
          if (WelcomeController.to.settingsModel!
                  .comMinichatJolieVideochatDirect.appUpdate.isUpdateRequire ==
              true) {
            return false;
          } else {
            return true;
          }
        },
        title: "Alert".tr,
        barrierDismissible: WelcomeController
                    .to
                    .settingsModel!
                    .comMinichatJolieVideochatDirect
                    .appUpdate
                    .isUpdateRequire ==
                true
            ? false
            : true,
        content: WelcomeController.to.settingsModel!
                .comMinichatJolieVideochatDirect.appUpdate.appIcon.isEmpty
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Image.asset(
                    AssetConfig.APP_LOGO_BIG,
                    height: 150.h,
                  ),
                ),
              )
            : Image.network(
                WelcomeController.to.settingsModel!
                    .comMinichatJolieVideochatDirect.appUpdate.appIcon,
                height: 150.h,
              ),
        actions: [
          Column(
            children: [
              Text(
                  WelcomeController.to.settingsModel!
                      .comMinichatJolieVideochatDirect.appUpdate.title.tr,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.h,
              ),
              Text(
                  WelcomeController
                      .to
                      .settingsModel!
                      .comMinichatJolieVideochatDirect
                      .appUpdate
                      .defaultMessage
                      .tr,
                  textAlign: TextAlign.center),
              SizedBox(
                height: 5.h,
              )
            ],
          )
        ],
        backgroundColor: Colors.white,
        titleStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        middleTextStyle: const TextStyle(
          color: Colors.white,
        ),
        confirm: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WelcomeController
                            .to
                            .settingsModel!
                            .comMinichatJolieVideochatDirect
                            .appUpdate
                            .isUpdateRequire ==
                        false
                    ? InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "No Thanks".tr,
                          style: TextStyle(
                              color: ColorConfig.PRIMARY_COLOR,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: WelcomeController
                              .to
                              .settingsModel!
                              .comMinichatJolieVideochatDirect
                              .appUpdate
                              .isUpdateRequire ==
                          true
                      ? 0.w
                      : 30.w,
                ),

                Container(
                  height: 40.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  width: 130.w,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10))),
                          alignment: Alignment.center,
                          height: 70.h,
                          child: Text(
                            "Ad",
                            style: TextStyle(fontSize: 12.w),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            launch(WelcomeController
                                .to
                                .settingsModel!
                                .comMinichatJolieVideochatDirect
                                .appUpdate
                                .websiteUrl);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            alignment: Alignment.center,
                            height: 70.h,
                            child: Text(
                              "Download".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )

                // Stack(
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         launch(WelcomeController.to.settingsModel!
                //             .comMinichatJolieVideochatDirect.appUpdate.websiteUrl);
                //       },
                //       child: Stack(
                //         children: [
                //           Container(
                //             padding: EdgeInsets.all(10.h),
                //             decoration: BoxDecoration(
                //                 color: Colors.black,
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(10.sp))),
                //             child: const Text(
                //               "    Download   ",
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //           ),
                //           Align(
                //             alignment: Alignment.center,
                //             child: Container(
                //                 padding: EdgeInsets.all(10.h),
                //                 decoration: BoxDecoration(
                //                     color: ColorConfig.ACCENT_COLOR,
                //                     borderRadius:
                //                         BorderRadius.all(Radius.circular(2.sp))),
                //                 child: Text(
                //                   "Ad",
                //                   style: TextStyle(
                //                       color: Colors.white, fontSize: 13.w),
                //                 )),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
        // confirm: Container(
        //   child: Text("Download App"),
        // ),
        radius: 10);
  }
}
// updateDialoug() {
//   (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect.appUpdate
//                   .isPopupDialog ==
//               true &&
//           (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect.appUpdate.updatedVersionCode ?? 1) > versionCode)
//       ? Future.delayed(const Duration(seconds: 0), () {
//           Get.defaultDialog(
//               onWillPop: () async {
//                 if (WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
//                         .appUpdate.isUpdateRequire ==
//                     true) {
//                   return false;
//                 } else {
//                   return true;
//                 }
//               },
//               barrierDismissible: !(WelcomeController.to.settingsModel!
//                   .comMinichatJolieVideochatDirect.appUpdate.isUpdateRequire),
//               content: Image.network(
//                 WelcomeController
//                     .to.settingsModel!.comMinichatJolieVideochatDirect.appUpdate.appIcon,
//                 height: 10.h,
//               ),
//               actions: [
//                 Center(
//                   child: Column(
//                     children: [
//                       Text(
//                           WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
//                               .appUpdate.title,
//                           style: const TextStyle(
//                               color: Colors.black, fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center),
//                       Text(
//                           "\n${WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect.appUpdate.defaultMessage}",
//                           textAlign: TextAlign.center),
//                       SizedBox(
//                         height: 2.h,
//                       )
//                     ],
//                   ),
//                 )
//               ],
//               backgroundColor: Colors.white,
//               titleStyle: const TextStyle(
//                   color: Colors.black, fontWeight: FontWeight.bold),
//               middleTextStyle: const TextStyle(
//                 color: Colors.white,
//               ),
//               confirm: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
//                                 .appUpdate.isUpdateRequire ==
//                             true
//                         ? 0.w
//                         : 4.w,
//                   ),
//                   WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
//                               .appUpdate.isUpdateRequire !=
//                           true
//                       ? InkWell(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: const Text(
//                             "No Thanks",
//                             style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       : Container(),
//                   SizedBox(
//                     width: WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
//                                 .appUpdate.isUpdateRequire ==
//                             true
//                         ? 0.w
//                         : 8.5.w,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       // ignore: deprecated_member_use
//                       launch(WelcomeController.to.settingsModel!
//                           .comMinichatJolieVideochatDirect.appUpdate.websiteUrl);
//                     },
//                     child: Stack(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(
//                               left: 2.h, right: 2.h, top: 1.h, bottom: 1.h),
//                           decoration: const BoxDecoration(color: Colors.amber),
//                           child: const Text(
//                             " Download",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Container(
//                           decoration: const BoxDecoration(color: Colors.orange),
//                           child: Text(
//                             "Ad",
//                             style:
//                                 TextStyle(fontSize: 3.w, color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect
//                                 .appUpdate.isUpdateRequire ==
//                             true
//                         ? 0.w
//                         : 4.w,
//                   ),
//                 ],
//               ),
//               // confirm: Container(
//               //   child: Text("Download App"),
//               // ),
//               radius: 10);
//         })
//       : Container();
// }
