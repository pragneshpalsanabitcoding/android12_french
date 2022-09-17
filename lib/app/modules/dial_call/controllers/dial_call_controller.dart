import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

import '../../../adssss.dart';
import '../../../constants/api_config.dart';
import '../../../dialogs/snackbar_dialog.dart';
import '../../../models/app_data_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/jitsi_service.dart';
import '../../../services/socket_service.dart';
import '../../end_call/controllers/end_call_controller.dart';
import '../../home/views/home_view.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../welcome/controllers/welcome_controller.dart';

class DialCallController extends GetxController {
  static DialCallController to = Get.put(DialCallController());

  //TODO: Implement DialCallController

  RxBool isHangup = false.obs;
  RxBool inCall = false.obs;

  RxInt timerCount = 0.obs;
  Timer? timerPeriodic;
  Timer? timerCallTimeout;
  Timer? timerMinDialingTime;

  /// it will use to store opponent caller id
  Map? opponentUser;

  @override
  void onInit() {}

  /// it will reset all flags.
  reset() async {
    isHangup.value = false;

    timerPeriodic?.cancel();
    timerPeriodic = null;
    timerCallTimeout?.cancel();
    timerCallTimeout = null;
    timerMinDialingTime?.cancel();
    timerMinDialingTime = null;

    opponentUser = null;

    timerCount.value = 0;
  }

  /// it will start connect with video call.
  connect() async {
    reset();

    AppData appSettings = WelcomeController.to.appDataModel.appData;

    /// it will use to set maximum dialing time. then after it will set fake video call.
    timerMinDialingTime =
        Timer(Duration(seconds: appSettings.minDialingTime), () async {
          timerMinDialingTime?.cancel();

          /// socket service initialized here.
          _initializingSocketService();

          /// it execute at specific time count.
          timerCallTimeout =
              Timer(Duration(seconds: appSettings.callTimeout), () async {
                timerCallTimeout!.cancel();

                ///if live call connected then it will not execute. other wise it will play fake call.
                SocketService.getInstance().disconnect();
                hangUp();
                SnackBarDialog.instance.show(ApiConfig.ERROR,
                    "There is no single user online.\nPlease try again".tr);
              });
        });
  }

  /// it will initializing signaling with listener.
  _initializingSocketService() {
    AppData appSettings = WelcomeController.to.appDataModel.appData;

    if (appSettings.socketServerAddress.isNotEmpty) {
      /// Socket event handler
      SocketService.getInstance().subscribe(ApiConfig.SOCKET_CONNECT, (_) {
        print("Connect --- ${SocketService.getInstance().getSocketId()}");

        Map data = {};
        data["uid"] = ProfileController.to.selfId.value;
        data["name"] = ProfileController.to.name.value;
        data["gender"] = ProfileController.to.gender.value.name;
        data["age"] = ProfileController.to.age.value;
        data["spamUserIds"] = ProfileController.to
            .getSpamUserIds()
            .reversed
            .toList()
            .sublist(
            0,
            min(appSettings.spamUserIdsLimit,
                ProfileController.to.getSpamUserIds().length));

        /// 4 means unlimited call time.
        data["userLevel"] = 4;
        SocketService.getInstance().startCall(data);
      });

      SocketService.getInstance().subscribe(ApiConfig.SOCKET_DISCONNECT,
              (_) async {
            JitsiService.getInstance().endVideoCall();
            hangUp();
          });

      SocketService.getInstance().subscribe(ApiConfig.SOCKET_START_CALL,
              (data) async {
            if (data != null) {
              String channelId = data["channel"]["channel_id"];
              Map caller = data["channel"]["caller"];
              Map? receiver = data["channel"]["receiver"];

              print("Start Call --- $channelId");
              if (receiver != null) {
                timerCallTimeout!.cancel();
                opponentUser = (caller["uid"] == ProfileController.to.selfId.value)
                    ? receiver
                    : caller;
                if (!ProfileController.to
                    .getSpamUserIds()
                    .contains(opponentUser!["uid"])) {
                  inCall.value = true;

                  /// it will remove loading screen
                  await JitsiService.getInstance()
                      .startVideoCall(channelId, ProfileController.to.name.value);
                }
              }
            }
          });

      SocketService.getInstance().subscribe(ApiConfig.SOCKET_END_CALL, (_) {
        print("End Call --- $_");
        SocketService.getInstance().disconnect();
      });

      /// jitsi event handler.
      JitsiService.getInstance().subscribe(ApiConfig.JITSI_ON_CONFERENCE_JOINED,
              (_) async {
            print("JITSI_ON_CONFERENCE_JOINED --- $_");

            _startTimer();
          });
      JitsiService.getInstance()
          .subscribe(ApiConfig.JITSI_ON_CONFERENCE_TERMINATED, (_) {
        print("JITSI_ON_CONFERENCE_TERMINATED ---");
        SocketService.getInstance().disconnect();
      });
      JitsiService.getInstance().subscribe(ApiConfig.JITSI_ON_ERROR, (_) {
        print("JITSI_ON_ERROR ---");
        SocketService.getInstance().disconnect();
      });

      /// socket connection start.
      print("Socket Server Url ::: ${appSettings.socketServerAddress}");
      SocketService.getInstance().connect(
        appSettings.socketServerAddress,
      );
    }
  }

  /// it will use to track call duration.
  _startTimer() {
    timerPeriodic ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      timerCount.value++;

      if (timerCount >=
          WelcomeController.to.appDataModel.appData.liveCallDurationSeconds) {
        SocketService.getInstance().disconnect();
      }
    });
  }

  /// it will use to hang up video call.
  hangUp({bool dueToTimeLimit = false, from = ""}) async {
    /// it will prevent unnecessary call
    print("JITSI ----~!~~~~~ isHangup.value ==== ${isHangup.value}");
    inCall.value = false;
    if (!isHangup.value) {
      JitsiService.getInstance().unSubscribeAll();

      if (timerPeriodic != null) {
        timerPeriodic!.cancel();
        timerPeriodic = null;
      }

      if (timerCallTimeout != null) {
        timerCallTimeout!.cancel();
        timerCallTimeout = null;
      }

      if (timerMinDialingTime != null) {
        timerMinDialingTime!.cancel();
        timerMinDialingTime = null;
      }

      isHangup.value = true;
      if (timerCount >
          WelcomeController
              .to
              .settingsModel!
              .comMinichatJolieVideochatDirect
              .adSetting
              .secondsRequireTrigerReward &&
          WelcomeController
              .to
              .settingsModel!
              .comMinichatJolieVideochatDirect
              .adsSequence
              .isNotEmpty) {
        EndCallController.to.isRewaredAdsShow.value = true;
      }

      if (timerCount > 0) {
        WelcomeController.to.isAdShow.value = true;
        showIntraAds();
        Get.offNamed(Routes.END_CALL, arguments: opponentUser);
      } else {
        WelcomeController.to.isAdShow.value = true;
        showIntraAds();
        Get.off(HomeView());
      }
    } else {
      print("Yes yes Open Adddddddsss dial call 33");
      WelcomeController.to.isAdShow.value = true;
      EndCallController.to.isRewaredAdsShow.value = false;
    }
  }
}
