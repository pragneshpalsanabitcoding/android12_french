import 'package:get/get.dart';

import '../controllers/dial_call_controller.dart';

class DialCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialCallController>(
      () => DialCallController(),
    );
  }
}
