import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/asset_config.dart';
import '../../modules/welcome/controllers/welcome_controller.dart';

rateDailog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      // barrierColor: Colors.transparent,
      useSafeArea: true,
      // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 5.0,
            image: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.only(left: 60.w, right: 60.w),
                child: Image.asset(AssetConfig.APP_LOGO_BIG, height: 120.h)),
            title: Text(
              "Rate us".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.w,
                fontWeight: FontWeight.bold,
              ),
            ),
            message: Text(
              "Tap a star to set your rating".tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            // your app's logo?
            submitButtonText: 'Submit'.tr,
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              // TODO: add your own logic
              if (response.rating <= 2.0) {
                MotionToast.success(
                        title: Text("Thanks For Your Rating".tr),
                        description: Text("We Will Improve App".tr),
                        width: 300)
                    .show(context);
              } else {
                print(
                    " 102030 ${WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect.rateApp.rateAppUrl}");

                // ignore: deprecated_member_use
                launch(WelcomeController.to.settingsModel!
                    .comMinichatJolieVideochatDirect.rateApp.rateAppUrl);
              }
            },
            starSize: 30,
          ));
}
