import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/color_config.dart';
import '../../routes/app_pages.dart';
import '../profile/controllers/profile_controller.dart';
import '../profile/views/profile_view.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({Key? key}) : super(key: key);

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'française', 'locale': const Locale('fr', 'FR')},
  ];

  updateLanguage(Locale locale) {
    Get.updateLocale(locale);
  }

  int selectedCard = 0;

  List imageCountry = [
    "assets/icons_new/english.png",
    "assets/icons_new/arabic.png",
  ];

  @override
  void initState() {
    super.initState();
    checkSelectLang();
  }

  checkSelectLang() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var number = preferences.getInt("selectlang") ?? 0;

    setState(() {
      selectedCard = number;
    });
  }

  bool language1 = true;
  bool language2 = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConfig.PRIMARY_COLOR,
        // appBar: AppBar(
        //   title: Text("message".tr),
        // ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons_new/loca1.png"))),
          child: Center(
            child: Container(
              margin: EdgeInsets.only(left: 50.w, right: 50.w),
              height: 500.h,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Image.asset(
                      "assets/icons_new/loca.png",
                      height: 100.h,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Select Language",
                    style: TextStyle(color: Colors.grey, fontSize: 20.w),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.h),
                    child: SizedBox(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              selectedCard = index;
                              updateLanguage(locale[index]['locale']);

                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();

                              pref.setInt("selectlang", selectedCard);

                              if (selectedCard == 0) {
                                pref.setBool("language", false);
                              } else {
                                pref.setBool("language", true);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(10.h),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: selectedCard == index
                                            ? const Color(0xff007A3D)
                                                .withOpacity(0.40)
                                            : Colors.grey.withOpacity(0.3),
                                        blurRadius: 5.0,
                                        offset: const Offset(2, 2)),
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  border: Border.all(
                                      color: selectedCard == index
                                          ? const Color(0xff007A3D)
                                          : Colors.grey),
                                  color: selectedCard == index
                                      ? Colors.white
                                      : Colors.white),
                              child: selectedCard != index
                                  ? Blur(
                                      blur: 0.1,
                                      // blurColor: Colors.black.withOpacity(0.1),
                                      blurColor: Colors.black.withOpacity(0.05),
                                      colorOpacity: 0.2,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(19)),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "${imageCountry[index]}",
                                              height: 60.h,
                                              width: 1000.w,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Text(
                                              "${locale[index]["name"]}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                          Image.asset(
                                            "${imageCountry[index]}",
                                            height: 60.h,
                                            width: 1000.w,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Text(
                                            "${locale[index]["name"]}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ]),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 4 / 5, crossAxisCount: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: InkWell(
                      onTap: () async {
                        await ProfileController.to.loadData();
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        await pref.setString("selectlanggg", "langDone");
                        if (ProfileController.to.age.value == 0) {
                          Get.off(ProfileView());
                        } else {
                          Get.offNamed(Routes.HOME);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 0.h),
                        width: 150.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            color: ColorConfig.BUTTON_COLOR,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.w,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
