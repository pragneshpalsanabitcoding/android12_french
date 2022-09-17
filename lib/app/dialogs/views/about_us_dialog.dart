import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_version/get_version.dart';

import '../../constants/asset_config.dart';
import '../../modules/welcome/controllers/welcome_controller.dart';

Future<void> showAboutUs(BuildContext context) async {
  String appName = await GetVersion.appName;
  String projectVersion = await GetVersion.projectVersion;
  return showAboutDialog(
    context: context,
    applicationIcon: SizedBox(
      height: 100.sp,
      width: 100.sp,
      child: Container(

        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.6),
            borderRadius: const BorderRadius.all(Radius.circular(20))
        ),

        child:  Image(
          image: AssetImage(AssetConfig.APP_LOGO_BIG),
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
    ),
    // s,
    // applicationLegalese: apiModel!.aboutApp!.registrationDetail,
    applicationName: appName.tr,
    applicationVersion: projectVersion,
    children: <Widget>[
      Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text("${WelcomeController
              .to.settingsModel!.comMinichatJolieVideochatDirect.aboutApp.aboutMessage}".tr))
    ],
  );
}
