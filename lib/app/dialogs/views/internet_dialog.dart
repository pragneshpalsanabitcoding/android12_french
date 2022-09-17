import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class CheckInternetConnetion extends StatefulWidget {
  @override
  State<CheckInternetConnetion> createState() => _CheckInternetConnetionState();
}

class _CheckInternetConnetionState extends State<CheckInternetConnetion> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showStatus();
  }

  showStatus() {
    Future.delayed(Duration(seconds: 0), () {
      showDialog(
          context: context,
          builder: (val) {
            return SimpleDialog(
              alignment: Alignment.center,
              children: [
                Center(
                    child: Text(
                  "Please Check Internet Connection".tr,
                  style: TextStyle(fontSize: 20.w),
                )),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      print("12312");

                      var connectivityResult =
                          await (Connectivity().checkConnectivity());

                      if (connectivityResult == ConnectivityResult.mobile ||
                          connectivityResult == ConnectivityResult.wifi) {
                        // Get.to(WelcomeView());

                      } else {
                        MotionToast.success(
                            title:
                                const Text("Please Check Internet Connection"),
                            description: const Text("Try Again"),
                            width: 300);

                        showToast(
                          'Please Check Internet Connection',
                          context: context,
                          animation: StyledToastAnimation.fadeScale,
                          reverseAnimation: StyledToastAnimation.fadeScale,
                          position: StyledToastPosition.center,
                          animDuration: const Duration(seconds: 1),
                          duration: const Duration(seconds: 2),
                          curve: Curves.elasticOut,
                          reverseCurve: Curves.linear,
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.h),
                      decoration: BoxDecoration(
                          color: Colors.yellow[200],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        "Retry",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.w),
                      ),
                    ),
                  ),
                )
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
