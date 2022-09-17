import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uk_video_call/app/dialogs/views/rate_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/api_config.dart';
import '../../constants/asset_config.dart';
import '../../constants/color_config.dart';
import '../../dialogs/snackbar_dialog.dart';
import '../../models/SettingsModel.dart';
import '../../modules/welcome/controllers/welcome_controller.dart';
import 'button_with_label_widget_view.dart';

class MenuPanelWidgetView extends StatelessWidget {
  const MenuPanelWidgetView({Key? key}) : super(key: key);

  void launchURL(String? url) async {
    if (!await launchUrl(Uri.parse(url ?? ""))) {
      print("Url not load");
    }
  }

  void showRatingDialog(BuildContext context, SettingsModel settings) {
    // We use the built in showDialog function to show our Rating Dialog
    showDialog(
        context: context,
        barrierDismissible: true, // set to false if you want to force a rating
        builder: (context) {
          return RatingDialog(
              initialRating: 5.0,
              starSize: 30,
              // your app's name?
              title: Text(
                'Rate us'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // encourage your user to leave a high rating?
              message: Text(
                'Tap a star to set your rating. Add more description here if you want.'
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp),
              ),
              // your app's logo?
              image: SizedBox(
                child: Image(
                  image: AssetConfig.LOGO,
                  fit: BoxFit.contain,
                ),
                height: 100.sp,
                width: 100.sp,
              ),
              submitButtonText: 'Submit',
              submitButtonTextStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConfig.BLACK_COLOR),
              commentHint: 'Write description...',
              onCancelled: () {
                print('cancelled');
              },
              onSubmitted: (response) {
                print("onSubmitPressed: rating = ${response.rating}");
                if (response.rating > 3) {
                  if (settings.comMinichatJolieVideochatDirect.rateApp
                      .rateAppUrl.isNotEmpty) {
                    launchURL(settings
                        .comMinichatJolieVideochatDirect.rateApp.rateAppUrl);
                  } else {
                    launchURL(
                        "https://play.google.com/store/apps/details?id=${settings.comMinichatJolieVideochatDirect.rateApp.packageId}");
                  }
                } else {
                  SnackBarDialog.instance
                      .show(ApiConfig.SUCCESS, "Thanks for your support.");
                }
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Stack(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Text(
                      "Ad",
                      style: TextStyle(color: Colors.white, fontSize: 12.w),
                    )),
                ButtonWithLabelWidgetView(
                  visibility: WelcomeController.to.settingsModel!
                      .comMinichatJolieVideochatDirect.moreAppUrl.isNotEmpty,
                  title: "More Apps".tr,
                  image: AssetConfig.IC_MORE_APP,
                  textColor: ColorConfig.WHITE_COLOR,
                  callback: () {
                    launch(
                        "${WelcomeController.to.settingsModel!.comMinichatJolieVideochatDirect.moreAppUrl}");
                  },
                ),
              ],
            ),
          ],
        ),
        Visibility(
            visible: (WelcomeController.to.settingsModel!
                    .comMinichatJolieVideochatDirect.rateApp.isRateApp &&
                WelcomeController.to.settingsModel!
                    .comMinichatJolieVideochatDirect.moreAppUrl.isNotEmpty),
            child: Container(
              color: ColorConfig.ACCENT_COLOR,
              height: 50.h,
              width: 1.w,
            )),
        ButtonWithLabelWidgetView(
          visibility: WelcomeController.to.settingsModel!
              .comMinichatJolieVideochatDirect.rateApp.isRateApp,
          title: "Rate us".tr,
          image: AssetConfig.IC_RATE_APP,
          textColor: ColorConfig.WHITE_COLOR,
          callback: () {
            // showRatingDialog(
            //     context, WelcomeController.to.settingsModel.settings);
            rateDailog(context);
          },
        ),
        Visibility(
            visible: WelcomeController.to.settingsModel!
                    .comMinichatJolieVideochatDirect.shareApp.isShareApp &&
                (WelcomeController.to.settingsModel!
                    .comMinichatJolieVideochatDirect.rateApp.isRateApp),
            child: Container(
              color: ColorConfig.ACCENT_COLOR,
              height: 50.h,
              width: 1.w,
            )),
        ButtonWithLabelWidgetView(
          visibility: WelcomeController.to.settingsModel!
              .comMinichatJolieVideochatDirect.shareApp.isShareApp,
          title: "Share App".tr,
          image: AssetConfig.IC_SHARE_APP,
          textColor: ColorConfig.WHITE_COLOR,
          callback: () {
            Share.share(WelcomeController.to.settingsModel!
                .comMinichatJolieVideochatDirect.shareApp.shareTitle);
          },
        )
      ],
    );
  }
}
