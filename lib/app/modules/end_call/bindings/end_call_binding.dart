import 'package:get/get.dart';

import '../controllers/end_call_controller.dart';

class EndCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EndCallController>(
      () => EndCallController(),
    );
  }
}
