import 'dart:convert';

AppDataModel appDataModelFromJson(String str) =>
    AppDataModel.fromJson(json.decode(str));
String appDataModelToJson(AppDataModel data) => json.encode(data.toJson());

class AppDataModel {
  AppDataModel({
    required this.appData,
  });

  AppData appData;

  factory AppDataModel.fromJson(Map<String, dynamic> json) => AppDataModel(
        appData: AppData.fromJson(json["App_Data"]),
      );

  Map<String, dynamic> toJson() => {
        "App_Data": appData.toJson(),
      };
}

class AppData {
  AppData({
    required this.isOverride,
    required this.appName,
    required this.serverAddress,
    required this.minDialingTime,
    required this.callTimeout,
    required this.socketServerAddress,
    required this.isRandomSelfId,
    required this.liveCallDurationSeconds,
    required this.videoCallConfig,
    required this.callTimeoutOfferDialog,
    required this.spamUserIdsLimit,
  });

  bool isOverride;
  String appName;
  String serverAddress;
  int minDialingTime;
  int callTimeout;
  String socketServerAddress;
  bool isRandomSelfId;
  int liveCallDurationSeconds;
  int spamUserIdsLimit;
  VideoCallConfig videoCallConfig;
  CallTimeoutOfferDialog callTimeoutOfferDialog;

  factory AppData.fromJson(Map<String, dynamic> json) => AppData(
        isOverride: json["is_override"],
        appName: json["app_name"],
        serverAddress: json["server_address"],
        minDialingTime: json["min_dialing_time"],
        callTimeout: json["call_timeout"],
        socketServerAddress: json["socket_server_address"],
        spamUserIdsLimit: json["spam_user_ids_limit"],
        isRandomSelfId: json["is_random_self_id"],
        liveCallDurationSeconds: json["live_call_duration_seconds"],
        videoCallConfig: VideoCallConfig.fromJson(json["video_call_config"]),
        callTimeoutOfferDialog:
            CallTimeoutOfferDialog.fromJson(json["call_timeout_offer_dialog"]),
      );

  Map<String, dynamic> toJson() => {
        "is_override": isOverride,
        "app_name": appName,
        "server_address": serverAddress,
        "min_dialing_time": minDialingTime,
        "call_timeout": callTimeout,
        "socket_server_address": socketServerAddress,
        "spam_user_ids_limit": spamUserIdsLimit,
        "is_random_self_id": isRandomSelfId,
        "live_call_duration_seconds": liveCallDurationSeconds,
        "video_call_config": videoCallConfig.toJson(),
        "call_timeout_offer_dialog": callTimeoutOfferDialog.toJson(),
      };
}

class CallTimeoutOfferDialog {
  CallTimeoutOfferDialog({
    required this.isShow,
    required this.isShowEveryTime,
    required this.talkTimeTitle,
    required this.level1Title,
    required this.level1Value,
    required this.level1Button,
    required this.level1Message,
    required this.level2Title,
    required this.level2Value,
    required this.level2Button,
    required this.level2Message,
    required this.successTitle,
    required this.successValue,
    required this.successMessage,
  });

  bool isShow;
  bool isShowEveryTime;
  String talkTimeTitle;
  String level1Title;
  int level1Value;
  String level1Button;
  String level1Message;
  String level2Title;
  int level2Value;
  String level2Button;
  String level2Message;
  String successTitle;
  String successValue;
  String successMessage;

  factory CallTimeoutOfferDialog.fromJson(Map<String, dynamic> json) =>
      CallTimeoutOfferDialog(
        isShow: json["is_show"],
        isShowEveryTime: json["is_show_every_time"],
        talkTimeTitle: json["talk_time_title"],
        level1Title: json["level1_title"],
        level1Value: json["level1_value"],
        level1Button: json["level1_button"],
        level1Message: json["level1_message"],
        level2Title: json["level2_title"],
        level2Value: json["level2_value"],
        level2Button: json["level2_button"],
        level2Message: json["level2_message"],
        successTitle: json["success_title"],
        successValue: json["success_value"],
        successMessage: json["success_message"],
      );

  Map<String, dynamic> toJson() => {
        "is_show": isShow,
        "is_show_every_time": isShowEveryTime,
        "talk_time_title": talkTimeTitle,
        "level1_title": level1Title,
        "level1_value": level1Value,
        "level1_button": level1Button,
        "level1_message": level1Message,
        "level2_title": level2Title,
        "level2_value": level2Value,
        "level2_button": level2Button,
        "level2_message": level2Message,
        "success_title": successTitle,
        "success_value": successValue,
        "success_message": successMessage,
      };
}

class VideoCallConfig {
  VideoCallConfig(
      {required this.isAudioOnly,
      required this.isAudioMuted,
      required this.isVideoMuted,
      required this.subjectText,
      required this.avatarUrl,
      required this.addPeopleEnable,
      required this.inviteEnabled,
      required this.calendarEnabled,
      required this.welcomePageEnabled,
      required this.raiseHandEnabled,
      required this.meetingNameEnabled,
      required this.meetingPasswordEnabled,
      required this.closeCaptionsEnabled,
      required this.chatEnabled,
      required this.liveStreamingEnabled,
      required this.tileViewEnabled,
      required this.toolboxAlwaysVisible,
      required this.recordingEnabled,
      required this.iosRecordingEnabled,
      required this.callIntegrationEnabled,
      required this.pipEnabled,
      required this.isCallIntegrationEnabled,
      required this.isConferenceTimerEnabled,
      required this.isFilmstripEnabled,
      required this.isFullscreenEnabled,
      required this.isHelpButtonEnabled,
      required this.isIosScreensharingEnabled,
      required this.isAndroidScreensharingEnabled,
      required this.isKickoutEnabled,
      required this.isLobbyModeEnabled,
      required this.isNotificationsEnabled,
      required this.isOverflowMenuEnabled,
      required this.isReactionsEnabled,
      required this.isReplaceParticipantEnabled,
      required this.resolution,
      required this.areSecurityOptionsEnabled,
      required this.isServerUrlChangeEnabled,
      required this.isTileViewEnabled,
      required this.isToolboxAlwaysVisible,
      required this.isToolboxEnabled,
      required this.isVideoMuteButtonEnabled,
      required this.isVideoShareButtonEnabled});

  bool isAudioOnly;
  bool isAudioMuted;
  bool isVideoMuted;
  String subjectText;
  String avatarUrl;
  bool addPeopleEnable;
  bool inviteEnabled;
  bool calendarEnabled;
  bool welcomePageEnabled;
  bool raiseHandEnabled;
  bool meetingNameEnabled;
  bool meetingPasswordEnabled;
  bool closeCaptionsEnabled;
  bool chatEnabled;
  bool liveStreamingEnabled;
  bool tileViewEnabled;
  bool toolboxAlwaysVisible;
  bool recordingEnabled;
  bool iosRecordingEnabled;
  bool callIntegrationEnabled;
  bool pipEnabled;
  bool isCallIntegrationEnabled;
  bool isConferenceTimerEnabled;
  bool isFilmstripEnabled;
  bool isFullscreenEnabled;
  bool isHelpButtonEnabled;
  bool isIosScreensharingEnabled;
  bool isAndroidScreensharingEnabled;
  bool isKickoutEnabled;
  bool isLobbyModeEnabled;
  bool isNotificationsEnabled;
  bool isOverflowMenuEnabled;
  bool isReactionsEnabled;
  bool isReplaceParticipantEnabled;
  bool resolution;
  bool areSecurityOptionsEnabled;
  bool isServerUrlChangeEnabled;
  bool isTileViewEnabled;
  bool isToolboxAlwaysVisible;
  bool isToolboxEnabled;
  bool isVideoMuteButtonEnabled;
  bool isVideoShareButtonEnabled;

  factory VideoCallConfig.fromJson(Map<String, dynamic> json) =>
      VideoCallConfig(
          isAudioOnly: json["is_audio_only"] ?? false,
          isAudioMuted: json["is_audio_muted"] ?? false,
          isVideoMuted: json["is_video_muted"] ?? false,
          subjectText: json["subject_text"] ?? false,
          avatarUrl: json["avatar_url"] ?? false,
          addPeopleEnable: json["add_people_enable"] ?? false,
          inviteEnabled: json["invite_enabled"] ?? false,
          calendarEnabled: json["calendar_enabled"] ?? false,
          welcomePageEnabled: json["welcome_page_enabled"] ?? false,
          raiseHandEnabled: json["raise_hand_enabled"] ?? false,
          meetingNameEnabled: json["meeting_name_enabled"] ?? false,
          meetingPasswordEnabled: json["meeting_password_enabled"] ?? false,
          closeCaptionsEnabled: json["close_captions_enabled"] ?? false,
          chatEnabled: json["chat_enabled"] ?? false,
          liveStreamingEnabled: json["live_streaming_enabled"] ?? false,
          tileViewEnabled: json["tile_view_enabled"] ?? false,
          toolboxAlwaysVisible: json["toolbox_always_visible"] ?? false,
          recordingEnabled: json["recording_enabled"] ?? false,
          iosRecordingEnabled: json["ios_recording_enabled"] ?? false,
          callIntegrationEnabled: json["call_integration_enabled"] ?? false,
          pipEnabled: json["pip_enabled"] ?? false,
          isCallIntegrationEnabled: json["isCallIntegrationEnabled"] ?? false,
          isConferenceTimerEnabled: json["isConferenceTimerEnabled"] ?? false,
          isFilmstripEnabled: json["isFilmstripEnabled"] ?? true,
          isFullscreenEnabled: json["isFullscreenEnabled"] ?? false,
          isHelpButtonEnabled: json["isHelpButtonEnabled"] ?? false,
          isIosScreensharingEnabled: json["isIosScreensharingEnabled"] ?? false,
          isAndroidScreensharingEnabled:
              json["isAndroidScreensharingEnabled"] ?? false,
          isKickoutEnabled: json["isKickoutEnabled"] ?? false,
          isLobbyModeEnabled: json["isLobbyModeEnabled"] ?? false,
          isNotificationsEnabled: json["isNotificationsEnabled"] ?? false,
          isOverflowMenuEnabled: json["isOverflowMenuEnabled"] ?? false,
          isReactionsEnabled: json["isReactionsEnabled"] ?? false,
          isReplaceParticipantEnabled:
              json["isReplaceParticipantEnabled"] ?? false,
          resolution: json["resolution"] ?? false,
          areSecurityOptionsEnabled: json["areSecurityOptionsEnabled"] ?? false,
          isServerUrlChangeEnabled: json["isServerUrlChangeEnabled"] ?? false,
          isTileViewEnabled: json["isTileViewEnabled"] ?? false,
          isToolboxAlwaysVisible: json["isToolboxAlwaysVisible"] ?? false,
          isToolboxEnabled: json["isToolboxEnabled"] ?? false,
          isVideoMuteButtonEnabled: json["isVideoMuteButtonEnabled"] ?? false,
          isVideoShareButtonEnabled:
              json["isVideoShareButtonEnabled"] ?? false);

  Map<String, dynamic> toJson() => {
        "is_audio_only": isAudioOnly,
        "is_audio_muted": isAudioMuted,
        "is_video_muted": isVideoMuted,
        "subject_text": subjectText,
        "avatar_url": avatarUrl,
        "add_people_enable": addPeopleEnable,
        "invite_enabled": inviteEnabled,
        "calendar_enabled": calendarEnabled,
        "welcome_page_enabled": welcomePageEnabled,
        "raise_hand_enabled": raiseHandEnabled,
        "meeting_name_enabled": meetingNameEnabled,
        "meeting_password_enabled": meetingPasswordEnabled,
        "close_captions_enabled": closeCaptionsEnabled,
        "chat_enabled": chatEnabled,
        "live_streaming_enabled": liveStreamingEnabled,
        "tile_view_enabled": tileViewEnabled,
        "toolbox_always_visible": toolboxAlwaysVisible,
        "recording_enabled": recordingEnabled,
        "ios_recording_enabled": iosRecordingEnabled,
        "call_integration_enabled": callIntegrationEnabled,
        "pip_enabled": pipEnabled,
        "isCallIntegrationEnabled": isCallIntegrationEnabled,
        "isConferenceTimerEnabled": isConferenceTimerEnabled,
        "isFilmstripEnabled": isFilmstripEnabled,
        "isFullscreenEnabled": isFullscreenEnabled,
        "isHelpButtonEnabled": isHelpButtonEnabled,
        "isIosScreensharingEnabled": isIosScreensharingEnabled,
        "isAndroidScreensharingEnabled": isAndroidScreensharingEnabled,
        "isKickoutEnabled": isKickoutEnabled,
        "isLobbyModeEnabled": isLobbyModeEnabled,
        "isNotificationsEnabled": isNotificationsEnabled,
        "isOverflowMenuEnabled": isOverflowMenuEnabled,
        "isReactionsEnabled": isReactionsEnabled,
        "isReplaceParticipantEnabled": isReplaceParticipantEnabled,
        "resolution": resolution,
        "areSecurityOptionsEnabled": areSecurityOptionsEnabled,
        "isServerUrlChangeEnabled": isServerUrlChangeEnabled,
        "isTileViewEnabled": isTileViewEnabled,
        "isToolboxAlwaysVisible": isToolboxAlwaysVisible,
        "isToolboxEnabled": isToolboxEnabled,
        "isVideoMuteButtonEnabled": isVideoMuteButtonEnabled,
        "isVideoShareButtonEnabled": isVideoShareButtonEnabled
      };
}
