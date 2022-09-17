import 'package:get/get.dart';

import '../modules/dial_call/bindings/dial_call_binding.dart';
import '../modules/dial_call/views/dial_call_view.dart';
import '../modules/end_call/bindings/end_call_binding.dart';
import '../modules/end_call/views/end_call_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/age_selection_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(name: _Paths.AGE_SELECTION, page: () => AgeSelectionView()),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DIAL_CALL,
      page: () => DialCallView(),
      binding: DialCallBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.END_CALL,
      page: () => EndCallView(),
      binding: EndCallBinding(),
    ),
  ];
}
