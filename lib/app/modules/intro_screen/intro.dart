import 'package:uk_video_call/app/modules/home/views/home_view.dart';
import 'package:uk_video_call/app/modules/language_selection/language_select.dart';
import 'package:uk_video_call/app/modules/profile/views/profile_view.dart';
import 'package:uk_video_call/app/modules/welcome/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_pages.dart';
import '../profile/controllers/profile_controller.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<SliderModel> mySLides = <SliderModel>[];
  int slideIndex = 0;
  PageController? controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey[300] : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff3C8CE7), Color(0xff00EAFF)])),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: <Widget>[
                  SlideTile(
                    imagePath: mySLides[0].getImageAssetPath(),
                    title: mySLides[0].getTitle(),
                    title2: mySLides[0].getTitle2(),
                    desc: mySLides[0].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[1].getImageAssetPath(),
                    title: mySLides[1].getTitle(),
                    title2: mySLides[1].getTitle2(),
                    desc: mySLides[1].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[2].getImageAssetPath(),
                    title: mySLides[0].getTitle(),
                    title2: mySLides[2].getTitle2(),
                    desc: mySLides[2].getDesc(),
                  )
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 280.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        i == slideIndex
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                ),
              ),
              slideIndex != 2
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 5.w, right: 20.w, bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                controller!.animateToPage(2,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.linear);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 120.w,
                                // padding: EdgeInsets.symmetric(horizontal: 9.w),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "reg",
                                      fontSize: 18.w),
                                ),
                              ),
                            ),

                            // ignore: deprecated_member_use
                            InkWell(
                              onTap: () {
                                print("this is slideIndex: $slideIndex");
                                controller!.animateToPage(slideIndex + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.linear);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 120.w,
                                // padding: EdgeInsets.symmetric(horizontal: 9.w),
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "reg",
                                      fontSize: 18.w),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding:
                          EdgeInsets.only(left: 5.w, right: 20.w, bottom: 20.h),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () async {
                            // Get.offNamed(Routes.PROFILE);

                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.setBool("intro", true);

                            var language = pref.getBool("language") ?? false;

                            if (language == true) {
                              await ProfileController.to.loadData();
                              if (ProfileController.to.age.value == 0) {
                                Get.off(ProfileView());
                              } else {
                                Get.offNamed(Routes.HOME);
                              }
                            } else {
                              Get.to(const LanguageSelection());
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 35.h,
                            width: 120.w,
                            // padding: EdgeInsets.symmetric(horizontal: 9.w),
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "reg",
                                  fontSize: 18.w),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String? imagePath, title, title2, desc;

  SlideTile({Key? key, this.imagePath, this.title, this.title2, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Image.asset(
            imagePath!,
            height: 1000.h,
            width: 1000.w,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 80.h, left: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.w,
                      color: Colors.black),
                ),
                Text(
                  title2!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32.w,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(desc!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.w, color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliderModel {
  String? imageAssetPath;
  String? title;
  String? title2;
  String? desc;

  SliderModel({this.imageAssetPath, this.title, this.title2, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setTitle2(String getTitle) {
    title2 = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String? getImageAssetPath() {
    return imageAssetPath;
  }

  String? getTitle() {
    return title;
  }

  String? getTitle2() {
    return title2;
  }

  String? getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel();

  //1
  sliderModel.setDesc("With Our cool Features");
  sliderModel.setTitle("Live Video");
  sliderModel.setTitle2("Calling All Over World");
  sliderModel.setImageAssetPath("assets/icons_new/intro1.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //2
  sliderModel.setDesc("send direct message to your match");
  sliderModel.setTitle("Intract");
  sliderModel.setTitle2("Around The World");
  sliderModel.setImageAssetPath("assets/icons_new/intro2.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //3
  sliderModel.setDesc("Enjoy videocalling with your favourite");
  sliderModel.setTitle("Enjoy Date");
  sliderModel.setTitle2("With Your Favourite");
  sliderModel.setImageAssetPath("assets/icons_new/intro3.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  return slides;
}
