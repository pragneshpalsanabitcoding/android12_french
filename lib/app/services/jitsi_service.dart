import 'dart:collection';
import 'dart:io';

import 'package:jitsi_meet/jitsi_meet.dart';

import '../constants/api_config.dart';
import '../models/app_data_model.dart';
import '../modules/welcome/controllers/welcome_controller.dart';

class JitsiService {
  JitsiService.internal();

  // next three lines makes this class a Singleton
  static final JitsiService _instance = JitsiService.internal();

  Map<String, Function> subscription = {};

  bool isFrontCamera = true;

  static JitsiService getInstance() {
    return _instance;
  }

  factory JitsiService() {
    return _instance;
  }

  /// Create agora sdk instance and initialize and start call.
  Future<void> startVideoCall(
    roomText,
    nameText, {
    avatarUrl = "",
    emailText = "",
  }) async {
    AppData appSettings = WelcomeController.to.appDataModel.appData;

    Map<FeatureFlagEnum, bool> featureFlags = HashMap();
    featureFlags[FeatureFlagEnum.ADD_PEOPLE_ENABLED] =
        appSettings.videoCallConfig.addPeopleEnable;
    featureFlags[FeatureFlagEnum.INVITE_ENABLED] =
        appSettings.videoCallConfig.inviteEnabled;
    featureFlags[FeatureFlagEnum.CALENDAR_ENABLED] =
        appSettings.videoCallConfig.calendarEnabled;
    featureFlags[FeatureFlagEnum.WELCOME_PAGE_ENABLED] =
        appSettings.videoCallConfig.welcomePageEnabled;
    featureFlags[FeatureFlagEnum.RAISE_HAND_ENABLED] =
        appSettings.videoCallConfig.raiseHandEnabled;
    featureFlags[FeatureFlagEnum.MEETING_NAME_ENABLED] =
        appSettings.videoCallConfig.meetingNameEnabled;
    featureFlags[FeatureFlagEnum.MEETING_PASSWORD_ENABLED] =
        appSettings.videoCallConfig.meetingPasswordEnabled;
    featureFlags[FeatureFlagEnum.CLOSE_CAPTIONS_ENABLED] =
        appSettings.videoCallConfig.closeCaptionsEnabled;
    featureFlags[FeatureFlagEnum.CHAT_ENABLED] =
        appSettings.videoCallConfig.chatEnabled;
    featureFlags[FeatureFlagEnum.LIVE_STREAMING_ENABLED] =
        appSettings.videoCallConfig.liveStreamingEnabled;
    featureFlags[FeatureFlagEnum.TILE_VIEW_ENABLED] =
        appSettings.videoCallConfig.tileViewEnabled;
    featureFlags[FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE] =
        appSettings.videoCallConfig.toolboxAlwaysVisible;
    featureFlags[FeatureFlagEnum.RECORDING_ENABLED] =
        appSettings.videoCallConfig.recordingEnabled;
    featureFlags[FeatureFlagEnum.IOS_RECORDING_ENABLED] =
        appSettings.videoCallConfig.iosRecordingEnabled;
    featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] =
        appSettings.videoCallConfig.isCallIntegrationEnabled;
    featureFlags[FeatureFlagEnum.TILE_VIEW_ENABLED] =
        appSettings.videoCallConfig.isTileViewEnabled;
    featureFlags[FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE] =
        appSettings.videoCallConfig.isToolboxAlwaysVisible;

    // Here is an example, disabling features for each platform
    if (Platform.isAndroid) {
      // Disable ConnectionService usage on Android to avoid issues (see README)
      featureFlags[FeatureFlagEnum.PIP_ENABLED] =
          appSettings.videoCallConfig.pipEnabled;
    } else if (Platform.isIOS) {
      // Disable PIP on iOS as it looks weird
      featureFlags[FeatureFlagEnum.PIP_ENABLED] =
          appSettings.videoCallConfig.pipEnabled;
    }

    // Define meetings options here
    var options = JitsiMeetingOptions(room: roomText)
      ..serverURL = appSettings.serverAddress
      ..subject = appSettings.videoCallConfig.subjectText
      ..userDisplayName = nameText
      ..userAvatarURL =
          (avatarUrl != "") ? avatarUrl : appSettings.videoCallConfig.avatarUrl
      ..userEmail = emailText
      ..audioOnly = appSettings.videoCallConfig.isAudioOnly
      ..audioMuted = appSettings.videoCallConfig.isAudioMuted
      ..videoMuted = appSettings.videoCallConfig.isVideoMuted
      ..featureFlags = featureFlags;

    await JitsiMeet.joinMeeting(options,
        listener: JitsiMeetingListener(
            onConferenceWillJoin: _onConferenceWillJoin,
            onConferenceJoined: _onConferenceJoined,
            onConferenceTerminated: _onConferenceTerminated,
            onPictureInPictureWillEnter: _onPictureInPictureWillEnter,
            onPictureInPictureTerminated: _onPictureInPictureTerminated,
            onError: _onError));
  }

  /// it will use to end call.
  Future<void> endVideoCall() async {
    JitsiMeet.removeAllListeners();
    JitsiMeet.closeMeeting();
  }

  /// user can subscribe channel events here.
  subscribe(String event, Function callback) {
    subscription[event] = callback;
  }

  /// user can unsubscribe all channel events here.
  unSubscribeAll() {
    subscription.clear();
  }

  /// Add jitsi event handlers
  void _onConferenceWillJoin(message) {
    if (subscription[ApiConfig.JITSI_ON_CONFERENCE_WILL_JOIN] != null) {
      Function? callback =
          subscription[ApiConfig.JITSI_ON_CONFERENCE_WILL_JOIN];
      callback!(message);
    }
  }

  void _onConferenceJoined(message) {
    if (subscription[ApiConfig.JITSI_ON_CONFERENCE_JOINED] != null) {
      Function? callback = subscription[ApiConfig.JITSI_ON_CONFERENCE_JOINED];
      callback!(message);
    }
  }

  void _onConferenceTerminated(message) {
    if (subscription[ApiConfig.JITSI_ON_CONFERENCE_TERMINATED] != null) {
      Function? callback =
          subscription[ApiConfig.JITSI_ON_CONFERENCE_TERMINATED];
      callback!(message);
    }
  }

  void _onPictureInPictureWillEnter(message) {
    if (subscription[ApiConfig.JITSI_ON_PICTURE_IN_PICTURE_WILL_ENTER] !=
        null) {
      Function? callback =
          subscription[ApiConfig.JITSI_ON_PICTURE_IN_PICTURE_WILL_ENTER];
      callback!(message);
    }
  }

  void _onPictureInPictureTerminated(message) {
    if (subscription[ApiConfig.JITSI_ON_PICTURE_IN_PICTURE_WILL_TERMINATED] !=
        null) {
      Function? callback =
          subscription[ApiConfig.JITSI_ON_PICTURE_IN_PICTURE_WILL_TERMINATED];
      callback!(message);
    }
  }

  void _onError(error) {
    if (subscription[ApiConfig.JITSI_ON_ERROR] != null) {
      Function? callback = subscription[ApiConfig.JITSI_ON_ERROR];
      callback!(error);
    }
  }
}
