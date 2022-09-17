import 'package:get/get.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class ProgressDialogView
{
  bool isProgressShown = false;
  final ProgressDialog pr = ProgressDialog(Get.context!,type: ProgressDialogType.normal, isDismissible: false, showLogs: false);

  static final ProgressDialogView instance = ProgressDialogView.internal();

  ProgressDialogView.internal();

  factory ProgressDialogView() {
    return instance;
  }

  Future<void> showProgress({String? title})
  async {
    if (isProgressShown == false)
      {
        pr.style(message: title??"Loading...");
        await pr.show();
        isProgressShown = true;
      }
  }

  Future<void> hideProgress()
  async {
    if (isProgressShown == true)
    {
      await pr.hide();
      isProgressShown = false;
    }
  }

}
