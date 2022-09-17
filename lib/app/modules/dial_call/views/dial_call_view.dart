import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:uk_video_call/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:lottie/lottie.dart';
import '../../../adssss.dart';
import '../../../constants/asset_config.dart';
import '../../../constants/color_config.dart';
import '../controllers/dial_call_controller.dart';

class DialCallView extends GetView<DialCallController>
    with WidgetsBindingObserver {
  DialCallView({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => initialization());
  }

  Future<void> initialization() async {
    await DialCallController.to.connect();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("state :::::::::::: $state");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
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
        backgroundColor: ColorConfig.PRIMARY_COLOR,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    "assets/icons_new/loca1.png",
                  ),
                ),
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                    color: ColorConfig.PRIMARY_SECOND,
                  )),
                ),
                WelcomeController
                    .to
                    .settingsModel!
                    .comMinichatJolieVideochatDirect
                    .adsSequence
                    .isNotEmpty
                    ? SafeArea(child: fullNativeAds())
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

              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Connecting....',
                    textStyle: TextStyle(color: Colors.white))
              ],
              isRepeatingAnimation: true,
              // pause: Duration(microseconds: 100),
              onTap: () {},
            ),
            SizedBox(
              height: 40.h,
            ),
            const SpinKitWave(
                color: Colors.white, type: SpinKitWaveType.start),
          ],
        ),
      ),
    );
  }
}

class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidLinearProgressIndicatorState();
}

class _AnimatedLiquidLinearProgressIndicatorState
    extends State<_AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
          seconds: WelcomeController.to.appDataModel.appData.callTimeout +
              WelcomeController.to.appDataModel.appData.minDialingTime),
    );

    _animationController!.addListener(() => setState(() {}));
    _animationController!.repeat();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 15.0,
        padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
        child: LiquidLinearProgressIndicator(
          value: _animationController!.value,
          backgroundColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation(Colors.black),
          borderRadius: 12.0,
          borderColor: Colors.black,
          borderWidth: 2,
        ),
      ),
    );
  }
}
