// // To parse this JSON data, do
// //
// //     final settingsModel = settingsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SettingsModel settingsModelFromJson(String str) =>
//     SettingsModel.fromJson(json.decode(str));
//
// String settingsModelToJson(SettingsModel data) => json.encode(data.toJson());
//
// class SettingsModel {
//   SettingsModel({
//     required this.globalIntraIntervalClick,
//     required this.interstitialAdTimeInterval,
//     required this.adsSequence,
//     required this.googleAds,
//     required this.customAds,
//     required this.appLovin,
//     required this.unityAds,
//     required this.settings,
//   });
//
//   int globalIntraIntervalClick;
//   int interstitialAdTimeInterval;
//   List<dynamic> adsSequence;
//   GoogleAds googleAds;
//   CustomAds customAds;
//   AppLovin appLovin;
//   UnityAds unityAds;
//   Settings settings;
//
//   factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
//     globalIntraIntervalClick: json["global_intra_interval_click"],
//     interstitialAdTimeInterval: json["interstitial_ad_time_interval"],
//     adsSequence: List<dynamic>.from(json["ads_sequence"].map((x) => x)),
//     googleAds: GoogleAds.fromJson(json["google_ads"]),
//     customAds: CustomAds.fromJson(json["custom_ads"]),
//     appLovin: AppLovin.fromJson(json["app_lovin"]),
//     unityAds: UnityAds.fromJson(json["unity_ads"]),
//     settings: Settings.fromJson(json["Settings"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "global_intra_interval_click": globalIntraIntervalClick,
//     "interstitial_ad_time_interval": interstitialAdTimeInterval,
//     "ads_sequence": List<dynamic>.from(adsSequence.map((x) => x)),
//     "google_ads": googleAds.toJson(),
//     "custom_ads": customAds.toJson(),
//     "app_lovin": appLovin.toJson(),
//     "unity_ads": unityAds.toJson(),
//     "Settings": settings.toJson(),
//   };
// }
//
// class AppLovin {
//   AppLovin({
//     required this.idUnitBanner,
//     required this.idUnitIntra,
//     required this.idUnitNative,
//     required this.rewaredAdsUnitId,
//     required this.isBannerAds,
//     required this.isInterstitialAds,
//     required this.isNativeAds,
//     required this.isRewaredAds,
//   });
//
//   String idUnitBanner;
//   String idUnitIntra;
//   String idUnitNative;
//   String rewaredAdsUnitId;
//   bool isBannerAds;
//   bool isInterstitialAds;
//   bool isNativeAds;
//   bool isRewaredAds;
//
//   factory AppLovin.fromJson(Map<String, dynamic> json) => AppLovin(
//     idUnitBanner: json["id_unit_banner"],
//     idUnitIntra: json["id_unit_intra"],
//     idUnitNative: json["id_unit_native"],
//     rewaredAdsUnitId: json["rewared_ads_unit_id"],
//     isBannerAds: json["is_banner_ads"],
//     isInterstitialAds: json["is_interstitial_ads"],
//     isNativeAds: json["is_native_ads"],
//     isRewaredAds: json["is_rewared_ads"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id_unit_banner": idUnitBanner,
//     "id_unit_intra": idUnitIntra,
//     "id_unit_native": idUnitNative,
//     "rewared_ads_unit_id": rewaredAdsUnitId,
//     "is_banner_ads": isBannerAds,
//     "is_interstitial_ads": isInterstitialAds,
//     "is_native_ads": isNativeAds,
//     "is_rewared_ads": isRewaredAds,
//   };
// }
//
// class CustomAds {
//   CustomAds({
//     required this.qurekaLink,
//     required this.isQurakaBanner,
//     required this.isQurakaIntera,
//     required this.closeButtonToDirectWeb,
//     required this.qurakaIntraImage,
//     required this.qurakaBannerImage,
//   });
//
//   String qurekaLink;
//   bool isQurakaBanner;
//   bool isQurakaIntera;
//   bool closeButtonToDirectWeb;
//   List<String> qurakaIntraImage;
//   List<String> qurakaBannerImage;
//
//   factory CustomAds.fromJson(Map<String, dynamic> json) => CustomAds(
//     qurekaLink: json["qureka_link"],
//     isQurakaBanner: json["is_quraka_banner"],
//     isQurakaIntera: json["is_quraka_intera"],
//     closeButtonToDirectWeb: json["close_button_to_direct_web"],
//     qurakaIntraImage:
//     List<String>.from(json["quraka_intra_image"].map((x) => x)),
//     qurakaBannerImage:
//     List<String>.from(json["quraka_banner_image"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "qureka_link": qurekaLink,
//     "is_quraka_banner": isQurakaBanner,
//     "is_quraka_intera": isQurakaIntera,
//     "close_button_to_direct_web": closeButtonToDirectWeb,
//     "quraka_intra_image":
//     List<dynamic>.from(qurakaIntraImage.map((x) => x)),
//     "quraka_banner_image":
//     List<dynamic>.from(qurakaBannerImage.map((x) => x)),
//   };
// }
//
// class GoogleAds {
//   GoogleAds({
//     required this.bannerAdUnitIdAndroid,
//     required this.interstitialAdUnitIdAndroid,
//     required this.appOpenAdUnitIdAndroid,
//     required this.nativeAdsUnitIdAndroid,
//     required this.nativeVideoAdsUnitIdAndroid,
//     required this.rewaredAdsUnitId,
//     required this.isBannerAds,
//     required this.isOpenAds,
//     required this.isInterstitialAds,
//     required this.isRewaredAds,
//     required this.isNativeAds,
//     required this.noOfClickInterstitial,
//   });
//
//   String bannerAdUnitIdAndroid;
//   String interstitialAdUnitIdAndroid;
//   String appOpenAdUnitIdAndroid;
//   String nativeAdsUnitIdAndroid;
//   String nativeVideoAdsUnitIdAndroid;
//   String rewaredAdsUnitId;
//   bool isBannerAds;
//   bool isOpenAds;
//   bool isInterstitialAds;
//   bool isRewaredAds;
//   bool isNativeAds;
//   int noOfClickInterstitial;
//
//   factory GoogleAds.fromJson(Map<String, dynamic> json) => GoogleAds(
//     bannerAdUnitIdAndroid: json["banner_ad_unit_id_android"],
//     interstitialAdUnitIdAndroid: json["interstitial_ad_unit_id_android"],
//     appOpenAdUnitIdAndroid: json["app_open_ad_unit_id_android"],
//     nativeAdsUnitIdAndroid: json["native_ads_unit_id_android"],
//     nativeVideoAdsUnitIdAndroid: json["native_video_ads_unit_id_android"],
//     rewaredAdsUnitId: json["rewared_ads_unit_id"],
//     isBannerAds: json["is_banner_ads"],
//     isOpenAds: json["is_open_ads"],
//     isInterstitialAds: json["is_interstitial_ads"],
//     isRewaredAds: json["is_rewared_ads"],
//     isNativeAds: json["is_native_ads"],
//     noOfClickInterstitial: json["no_of_click_interstitial"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "banner_ad_unit_id_android": bannerAdUnitIdAndroid,
//     "interstitial_ad_unit_id_android": interstitialAdUnitIdAndroid,
//     "app_open_ad_unit_id_android": appOpenAdUnitIdAndroid,
//     "native_ads_unit_id_android": nativeAdsUnitIdAndroid,
//     "native_video_ads_unit_id_android": nativeVideoAdsUnitIdAndroid,
//     "rewared_ads_unit_id": rewaredAdsUnitId,
//     "is_banner_ads": isBannerAds,
//     "is_open_ads": isOpenAds,
//     "is_interstitial_ads": isInterstitialAds,
//     "is_rewared_ads": isRewaredAds,
//     "is_native_ads": isNativeAds,
//     "no_of_click_interstitial": noOfClickInterstitial,
//   };
// }
//
// class Settings {
//   Settings({
//     required this.admobSettings,
//     required this.appUpdateInformation,
//     required this.startUpPopup,
//     required this.aboutApp,
//     required this.exitDialog,
//     required this.rateApp,
//     required this.appSettings,
//     required this.moreApps,
//     required this.shareApp,
//     required this.officialWebsite,
//     required this.privacyPolicy,
//     required this.termsOfUse,
//     required this.splashScreen,
//     required this.errorReportSupport,
//     required this.feedbackSupport,
//   });
//
//   AdmobSettings admobSettings;
//   AppUpdateInformation appUpdateInformation;
//   StartUpPopup startUpPopup;
//   AboutApp aboutApp;
//   ExitDialog exitDialog;
//   RateApp rateApp;
//   AppSettings appSettings;
//   MoreApps moreApps;
//   ShareApp shareApp;
//   OfficialWebsite officialWebsite;
//   PrivacyPolicy privacyPolicy;
//   TermsOfUse termsOfUse;
//   SplashScreen splashScreen;
//   ErrorReportSupport errorReportSupport;
//   FeedbackSupport feedbackSupport;
//
//   factory Settings.fromJson(Map<String, dynamic> json) => Settings(
//     admobSettings: AdmobSettings.fromJson(json["Admob_Settings"]),
//     appUpdateInformation:
//     AppUpdateInformation.fromJson(json["App_Update_Information"]),
//     startUpPopup: StartUpPopup.fromJson(json["Start_Up_Popup"]),
//     aboutApp: AboutApp.fromJson(json["About_App"]),
//     exitDialog: ExitDialog.fromJson(json["Exit_Dialog"]),
//     rateApp: RateApp.fromJson(json["Rate_App"]),
//     appSettings: AppSettings.fromJson(json["App_Settings"]),
//     moreApps: MoreApps.fromJson(json["More_Apps"]),
//     shareApp: ShareApp.fromJson(json["Share_App"]),
//     officialWebsite: OfficialWebsite.fromJson(json["Official_Website"]),
//     privacyPolicy: PrivacyPolicy.fromJson(json["Privacy_Policy"]),
//     termsOfUse: TermsOfUse.fromJson(json["Terms_Of_Use"]),
//     splashScreen: SplashScreen.fromJson(json["Splash_Screen"]),
//     errorReportSupport:
//     ErrorReportSupport.fromJson(json["Error_Report_Support"]),
//     feedbackSupport: FeedbackSupport.fromJson(json["Feedback_Support"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Admob_Settings": admobSettings.toJson(),
//     "App_Update_Information": appUpdateInformation.toJson(),
//     "Start_Up_Popup": startUpPopup.toJson(),
//     "About_App": aboutApp.toJson(),
//     "Exit_Dialog": exitDialog.toJson(),
//     "Rate_App": rateApp.toJson(),
//     "App_Settings": appSettings.toJson(),
//     "More_Apps": moreApps.toJson(),
//     "Share_App": shareApp.toJson(),
//     "Official_Website": officialWebsite.toJson(),
//     "Privacy_Policy": privacyPolicy.toJson(),
//     "Terms_Of_Use": termsOfUse.toJson(),
//     "Splash_Screen": splashScreen.toJson(),
//     "Error_Report_Support": errorReportSupport.toJson(),
//     "Feedback_Support": feedbackSupport.toJson(),
//   };
// }
//
// class AboutApp {
//   AboutApp({
//     required this.isOverride,
//     required this.isAboutApp,
//     required this.aboutTitle,
//     required this.aboutMessage,
//   });
//
//   bool isOverride;
//   bool isAboutApp;
//   String aboutTitle;
//   String aboutMessage;
//
//   factory AboutApp.fromJson(Map<String, dynamic> json) => AboutApp(
//     isOverride: json["is_override"],
//     isAboutApp: json["is_about_app"],
//     aboutTitle: json["about_title"],
//     aboutMessage: json["about_message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_about_app": isAboutApp,
//     "about_title": aboutTitle,
//     "about_message": aboutMessage,
//   };
// }
//
// class AdmobSettings {
//   AdmobSettings({
//     required this.isFullAds,
//     required this.onesignalId,
//     required this.isAppUpdatePopup,
//     required this.isDissmisable,
//     required this.appUpdateUrl,
//     required this.isOverride,
//     required this.adsLoadingText,
//     required this.adsLoadingDelay,
//     required this.isBannerAds,
//     required this.isInterstitialAds,
//   });
//
//   bool isFullAds;
//   String onesignalId;
//   bool isAppUpdatePopup;
//   bool isDissmisable;
//   String appUpdateUrl;
//   bool isOverride;
//   String adsLoadingText;
//   int adsLoadingDelay;
//   bool isBannerAds;
//   bool isInterstitialAds;
//
//   factory AdmobSettings.fromJson(Map<String, dynamic> json) => AdmobSettings(
//     isFullAds: json["is_full_ads"],
//     onesignalId: json["onesignal_id"],
//     isAppUpdatePopup: json["is_app_update_popup"],
//     isDissmisable: json["is_dissmisable"],
//     appUpdateUrl: json["app_update_url"],
//     isOverride: json["is_override"],
//     adsLoadingText: json["ads_loading_text"],
//     adsLoadingDelay: json["ads_loading_delay"],
//     isBannerAds: json["is_banner_ads"],
//     isInterstitialAds: json["is_interstitial_ads"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_full_ads": isFullAds,
//     "onesignal_id": onesignalId,
//     "is_app_update_popup": isAppUpdatePopup,
//     "is_dissmisable": isDissmisable,
//     "app_update_url": appUpdateUrl,
//     "is_override": isOverride,
//     "ads_loading_text": adsLoadingText,
//     "ads_loading_delay": adsLoadingDelay,
//     "is_banner_ads": isBannerAds,
//     "is_interstitial_ads": isInterstitialAds,
//   };
// }
//
// class AppSettings {
//   AppSettings({
//     required this.isOverride,
//     required this.appName,
//     required this.serverAddress,
//     required this.port,
//     required this.callType,
//     required this.callType1,
//     required this.callType2,
//     required this.callType3,
//     required this.minDialingTime,
//     required this.callTimeout,
//     required this.isRandomSelfId,
//     required this.fakeVideoVolume,
//     required this.fakeCallList,
//     required this.fakeCallBlockList,
//     required this.fakeCallPlaylist,
//   });
//
//   bool isOverride;
//   String appName;
//   String serverAddress;
//   int port;
//   String callType;
//   String callType1;
//   String callType2;
//   String callType3;
//   int minDialingTime;
//   int callTimeout;
//   bool isRandomSelfId;
//   double fakeVideoVolume;
//   List<String> fakeCallList;
//   List<String> fakeCallBlockList;
//   List<String> fakeCallPlaylist;
//
//   factory AppSettings.fromJson(Map<String, dynamic> json) => AppSettings(
//     isOverride: json["is_override"],
//     appName: json["app_name"],
//     serverAddress: json["server_address"],
//     port: json["port"],
//     callType: json["call_type"],
//     callType1: json["call_type1"],
//     callType2: json["call_type2"],
//     callType3: json["call_type3"],
//     minDialingTime: json["min_dialing_time"],
//     callTimeout: json["call_timeout"],
//     isRandomSelfId: json["is_random_self_id"],
//     fakeVideoVolume: json["fake_video_volume"].toDouble(),
//     fakeCallList: List<String>.from(json["fake_call_list"].map((x) => x)),
//     fakeCallBlockList:
//     List<String>.from(json["fake_call_block_list"].map((x) => x)),
//     fakeCallPlaylist:
//     List<String>.from(json["fake_call_playlist"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "app_name": appName,
//     "server_address": serverAddress,
//     "port": port,
//     "call_type": callType,
//     "call_type1": callType1,
//     "call_type2": callType2,
//     "call_type3": callType3,
//     "min_dialing_time": minDialingTime,
//     "call_timeout": callTimeout,
//     "is_random_self_id": isRandomSelfId,
//     "fake_video_volume": fakeVideoVolume,
//     "fake_call_list": List<dynamic>.from(fakeCallList.map((x) => x)),
//     "fake_call_block_list":
//     List<dynamic>.from(fakeCallBlockList.map((x) => x)),
//     "fake_call_playlist":
//     List<dynamic>.from(fakeCallPlaylist.map((x) => x)),
//   };
// }
//
// class AppUpdateInformation {
//   AppUpdateInformation({
//     required this.isOverride,
//     required this.isPopupDialog,
//     required this.isUpdateRequire,
//     required this.packageId,
//     required this.downloadUrl,
//     required this.websiteUrl,
//     required this.isSystemBrowser,
//     required this.updatedVersionCode,
//     required this.filename,
//     required this.title,
//     required this.defaultMessage,
//     required this.logMessage,
//     required this.downloadingMessage,
//     required this.installingMessage,
//   });
//
//   bool isOverride;
//   bool isPopupDialog;
//   bool isUpdateRequire;
//   String packageId;
//   String downloadUrl;
//   String websiteUrl;
//   bool isSystemBrowser;
//   int updatedVersionCode;
//   String filename;
//   String title;
//   String defaultMessage;
//   String logMessage;
//   String downloadingMessage;
//   String installingMessage;
//
//   factory AppUpdateInformation.fromJson(Map<String, dynamic> json) =>
//       AppUpdateInformation(
//         isOverride: json["is_override"],
//         isPopupDialog: json["is_popup_dialog"],
//         isUpdateRequire: json["is_update_require"],
//         packageId: json["package_id"],
//         downloadUrl: json["download_url"],
//         websiteUrl: json["website_url"],
//         isSystemBrowser: json["is_system_browser"],
//         updatedVersionCode: json["updated_version_code"],
//         filename: json["filename"],
//         title: json["title"],
//         defaultMessage: json["default_message"],
//         logMessage: json["log_message"],
//         downloadingMessage: json["downloading_message"],
//         installingMessage: json["installing_message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_popup_dialog": isPopupDialog,
//     "is_update_require": isUpdateRequire,
//     "package_id": packageId,
//     "download_url": downloadUrl,
//     "website_url": websiteUrl,
//     "is_system_browser": isSystemBrowser,
//     "updated_version_code": updatedVersionCode,
//     "filename": filename,
//     "title": title,
//     "default_message": defaultMessage,
//     "log_message": logMessage,
//     "downloading_message": downloadingMessage,
//     "installing_message": installingMessage,
//   };
// }
//
// class ErrorReportSupport {
//   ErrorReportSupport({
//     required this.isOverride,
//     required this.isErrorReport,
//     required this.ccEmailId,
//     required this.emailId,
//   });
//
//   bool isOverride;
//   bool isErrorReport;
//   String ccEmailId;
//   String emailId;
//
//   factory ErrorReportSupport.fromJson(Map<String, dynamic> json) =>
//       ErrorReportSupport(
//         isOverride: json["is_override"],
//         isErrorReport: json["is_error_report"],
//         ccEmailId: json["cc_email_id"],
//         emailId: json["email_id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_error_report": isErrorReport,
//     "cc_email_id": ccEmailId,
//     "email_id": emailId,
//   };
// }
//
// class ExitDialog {
//   ExitDialog({
//     required this.isOverride,
//     required this.exitTitle,
//     required this.exitMessage,
//   });
//
//   bool isOverride;
//   String exitTitle;
//   String exitMessage;
//
//   factory ExitDialog.fromJson(Map<String, dynamic> json) => ExitDialog(
//     isOverride: json["is_override"],
//     exitTitle: json["exit_title"],
//     exitMessage: json["exit_message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "exit_title": exitTitle,
//     "exit_message": exitMessage,
//   };
// }
//
// class FeedbackSupport {
//   FeedbackSupport({
//     required this.isOverride,
//     required this.isFeedback,
//     required this.ccEmailId,
//     required this.emailId,
//     required this.feedbackTitle,
//     required this.feedbackMessage,
//     required this.emailSubject,
//     required this.emailMessage,
//   });
//
//   bool isOverride;
//   bool isFeedback;
//   String ccEmailId;
//   String emailId;
//   String feedbackTitle;
//   String feedbackMessage;
//   String emailSubject;
//   String emailMessage;
//
//   factory FeedbackSupport.fromJson(Map<String, dynamic> json) =>
//       FeedbackSupport(
//         isOverride: json["is_override"],
//         isFeedback: json["is_feedback"],
//         ccEmailId: json["cc_email_id"],
//         emailId: json["email_id"],
//         feedbackTitle: json["feedback_title"],
//         feedbackMessage: json["feedback_message"],
//         emailSubject: json["email_subject"],
//         emailMessage: json["email_message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_feedback": isFeedback,
//     "cc_email_id": ccEmailId,
//     "email_id": emailId,
//     "feedback_title": feedbackTitle,
//     "feedback_message": feedbackMessage,
//     "email_subject": emailSubject,
//     "email_message": emailMessage,
//   };
// }
//
// class MoreApps {
//   MoreApps({
//     required this.isOverride,
//     required this.isMoreApp,
//     required this.developerId,
//     required this.moreAppUrl,
//   });
//
//   bool isOverride;
//   bool isMoreApp;
//   String developerId;
//   String moreAppUrl;
//
//   factory MoreApps.fromJson(Map<String, dynamic> json) => MoreApps(
//     isOverride: json["is_override"],
//     isMoreApp: json["is_more_app"],
//     developerId: json["developer_id"],
//     moreAppUrl: json["more_app_url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_more_app": isMoreApp,
//     "developer_id": developerId,
//     "more_app_url": moreAppUrl,
//   };
// }
//
// class OfficialWebsite {
//   OfficialWebsite({
//     required this.isOverride,
//     required this.isOfficialWebsite,
//     required this.isSystemBrowser,
//     required this.officialWebsite,
//   });
//
//   bool isOverride;
//   bool isOfficialWebsite;
//   bool isSystemBrowser;
//   String officialWebsite;
//
//   factory OfficialWebsite.fromJson(Map<String, dynamic> json) =>
//       OfficialWebsite(
//         isOverride: json["is_override"],
//         isOfficialWebsite: json["is_official_website"],
//         isSystemBrowser: json["is_system_browser"],
//         officialWebsite: json["official_website"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_official_website": isOfficialWebsite,
//     "is_system_browser": isSystemBrowser,
//     "official_website": officialWebsite,
//   };
// }
//
// class PrivacyPolicy {
//   PrivacyPolicy({
//     required this.isOverride,
//     required this.isPrivacyPolicy,
//     required this.isSystemBrowser,
//     required this.privacyPolicy,
//   });
//
//   bool isOverride;
//   bool isPrivacyPolicy;
//   bool isSystemBrowser;
//   String privacyPolicy;
//
//   factory PrivacyPolicy.fromJson(Map<String, dynamic> json) => PrivacyPolicy(
//     isOverride: json["is_override"],
//     isPrivacyPolicy: json["is_privacy_policy"],
//     isSystemBrowser: json["is_system_browser"],
//     privacyPolicy: json["privacy_policy"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_privacy_policy": isPrivacyPolicy,
//     "is_system_browser": isSystemBrowser,
//     "privacy_policy": privacyPolicy,
//   };
// }
//
// class RateApp {
//   RateApp({
//     required this.isOverride,
//     required this.isRateApp,
//     required this.packageId,
//     required this.rateAppUrl,
//     required this.rateMessage,
//   });
//
//   bool isOverride;
//   bool isRateApp;
//   String packageId;
//   String rateAppUrl;
//   String rateMessage;
//
//   factory RateApp.fromJson(Map<String, dynamic> json) => RateApp(
//     isOverride: json["is_override"],
//     isRateApp: json["is_rate_app"],
//     packageId: json["package_id"],
//     rateAppUrl: json["rate_app_url"],
//     rateMessage: json["rate_message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_rate_app": isRateApp,
//     "package_id": packageId,
//     "rate_app_url": rateAppUrl,
//     "rate_message": rateMessage,
//   };
// }
//
// class ShareApp {
//   ShareApp({
//     required this.isOverride,
//     required this.isShareApp,
//     required this.shareMessageApp,
//     required this.shareMessageLink,
//   });
//
//   bool isOverride;
//   bool isShareApp;
//   String shareMessageApp;
//   String shareMessageLink;
//
//   factory ShareApp.fromJson(Map<String, dynamic> json) => ShareApp(
//     isOverride: json["is_override"],
//     isShareApp: json["is_share_app"],
//     shareMessageApp: json["share_message_app"],
//     shareMessageLink: json["share_message_link"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_share_app": isShareApp,
//     "share_message_app": shareMessageApp,
//     "share_message_link": shareMessageLink,
//   };
// }
//
// class SplashScreen {
//   SplashScreen({
//     required this.isOverride,
//     required this.registrationDetail1,
//     required this.registrationDetail,
//     required this.versionDetail,
//   });
//
//   bool isOverride;
//   String registrationDetail1;
//   String registrationDetail;
//   String versionDetail;
//
//   factory SplashScreen.fromJson(Map<String, dynamic> json) => SplashScreen(
//     isOverride: json["is_override"],
//     registrationDetail1: json["registration_detail1"],
//     registrationDetail: json["registration_detail"],
//     versionDetail: json["version_detail"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "registration_detail1": registrationDetail1,
//     "registration_detail": registrationDetail,
//     "version_detail": versionDetail,
//   };
// }
//
// class StartUpPopup {
//   StartUpPopup({
//     required this.isOverride,
//     required this.isStartUpPopup,
//     required this.reminderCode,
//     required this.mode,
//     required this.isSystemBrowser,
//     required this.bannerUrl,
//     required this.fullTitle,
//     required this.description,
//     required this.websiteUrl,
//     required this.thumbnailUrl,
//   });
//
//   bool isOverride;
//   bool isStartUpPopup;
//   String reminderCode;
//   String mode;
//   bool isSystemBrowser;
//   String bannerUrl;
//   String fullTitle;
//   String description;
//   String websiteUrl;
//   String thumbnailUrl;
//
//   factory StartUpPopup.fromJson(Map<String, dynamic> json) => StartUpPopup(
//     isOverride: json["is_override"],
//     isStartUpPopup: json["is_start_up_popup"],
//     reminderCode: json["reminder_code"],
//     mode: json["mode"],
//     isSystemBrowser: json["is_system_browser"],
//     bannerUrl: json["banner_url"],
//     fullTitle: json["full_title"],
//     description: json["description"],
//     websiteUrl: json["website_url"],
//     thumbnailUrl: json["thumbnail_url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_start_up_popup": isStartUpPopup,
//     "reminder_code": reminderCode,
//     "mode": mode,
//     "is_system_browser": isSystemBrowser,
//     "banner_url": bannerUrl,
//     "full_title": fullTitle,
//     "description": description,
//     "website_url": websiteUrl,
//     "thumbnail_url": thumbnailUrl,
//   };
// }
//
// class TermsOfUse {
//   TermsOfUse({
//     required this.isOverride,
//     required this.isTermsOfUse,
//     required this.isSystemBrowser,
//     required this.termsOfUse,
//   });
//
//   bool isOverride;
//   bool isTermsOfUse;
//   bool isSystemBrowser;
//   String termsOfUse;
//
//   factory TermsOfUse.fromJson(Map<String, dynamic> json) => TermsOfUse(
//     isOverride: json["is_override"],
//     isTermsOfUse: json["is_terms_of_use"],
//     isSystemBrowser: json["is_system_browser"],
//     termsOfUse: json["terms_of_use"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "is_override": isOverride,
//     "is_terms_of_use": isTermsOfUse,
//     "is_system_browser": isSystemBrowser,
//     "terms_of_use": termsOfUse,
//   };
// }
//
// class UnityAds {
//   UnityAds({
//     required this.gameId,
//     required this.isIntraAds,
//     required this.isBannerAds,
//     required this.isRewaredAds,
//   });
//
//   String gameId;
//   bool isIntraAds;
//   bool isBannerAds;
//   bool isRewaredAds;
//
//   factory UnityAds.fromJson(Map<String, dynamic> json) => UnityAds(
//     gameId: json["game_id"],
//     isIntraAds: json["is_intra_ads"],
//     isBannerAds: json["is_banner_ads"],
//     isRewaredAds: json["is_rewared_ads"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "game_id": gameId,
//     "is_intra_ads": isIntraAds,
//     "is_banner_ads": isBannerAds,
//     "is_rewared_ads": isRewaredAds,
//   };
// }
