// To parse this JSON data, do
//
//     final settingsModel = settingsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SettingsModel settingsModelFromJson(String str) => SettingsModel.fromJson(json.decode(str));

String settingsModelToJson(SettingsModel data) => json.encode(data.toJson());

class SettingsModel {
  SettingsModel({
    required this.comMinichatJolieVideochatDirect,
  });

  ComMinichatJolieVideochatDirect comMinichatJolieVideochatDirect;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
    comMinichatJolieVideochatDirect: ComMinichatJolieVideochatDirect.fromJson(json["com.minichat.jolie.videochat.direct"]),
  );

  Map<String, dynamic> toJson() => {
    "com.minichat.jolie.videochat.direct": comMinichatJolieVideochatDirect.toJson(),
  };
}

class ComMinichatJolieVideochatDirect {
  ComMinichatJolieVideochatDirect({
    required this.adsSequence,
    required this.moreAppUrl,
    required this.extraUrl,
    required this.adSetting,
    required this.appUpdate,
    required this.exitDialog,
    required this.rewardDialog,
    required this.aboutApp,
    required this.rateApp,
    required this.shareApp,
    required this.privacyPolicy,
    required this.termsOfUse,
    required this.errorReport,
    required this.feedbackSupport,
    required this.googleAds,
    required this.facebookAds,
    required this.customAds,
    required this.appLovin,
  });

  List<String> adsSequence;
  String moreAppUrl;
  String extraUrl;
  AdSetting adSetting;
  AppUpdate appUpdate;
  ExitDialog exitDialog;
  RewardDialog rewardDialog;
  AboutApp aboutApp;
  RateApp rateApp;
  ShareApp shareApp;
  PrivacyPolicy privacyPolicy;
  TermsOfUse termsOfUse;
  ErrorReport errorReport;
  FeedbackSupport feedbackSupport;
  GoogleAds googleAds;
  FacebookAds facebookAds;
  CustomAds customAds;
  AppLovin appLovin;

  factory ComMinichatJolieVideochatDirect.fromJson(Map<String, dynamic> json) => ComMinichatJolieVideochatDirect(
    adsSequence: List<String>.from(json["ads_sequence"].map((x) => x)),
    moreAppUrl: json["more_app_url"],
    extraUrl: json["extra_url"],
    adSetting: AdSetting.fromJson(json["ad_setting"]),
    appUpdate: AppUpdate.fromJson(json["app_update"]),
    exitDialog: ExitDialog.fromJson(json["exit_dialog"]),
    rewardDialog: RewardDialog.fromJson(json["reward_dialog"]),
    aboutApp: AboutApp.fromJson(json["About_App"]),
    rateApp: RateApp.fromJson(json["rate_app"]),
    shareApp: ShareApp.fromJson(json["share_app"]),
    privacyPolicy: PrivacyPolicy.fromJson(json["privacy_policy"]),
    termsOfUse: TermsOfUse.fromJson(json["terms_of_use"]),
    errorReport: ErrorReport.fromJson(json["error_report"]),
    feedbackSupport: FeedbackSupport.fromJson(json["feedback_support"]),
    googleAds: GoogleAds.fromJson(json["google_ads"]),
    facebookAds: FacebookAds.fromJson(json["facebook_ads"]),
    customAds: CustomAds.fromJson(json["custom_ads"]),
    appLovin: AppLovin.fromJson(json["app_lovin"]),
  );

  Map<String, dynamic> toJson() => {
    "ads_sequence": List<dynamic>.from(adsSequence.map((x) => x)),
    "more_app_url": moreAppUrl,
    "extra_url": extraUrl,
    "ad_setting": adSetting.toJson(),
    "app_update": appUpdate.toJson(),
    "exit_dialog": exitDialog.toJson(),
    "reward_dialog": rewardDialog.toJson(),
    "About_App": aboutApp.toJson(),
    "rate_app": rateApp.toJson(),
    "share_app": shareApp.toJson(),
    "privacy_policy": privacyPolicy.toJson(),
    "terms_of_use": termsOfUse.toJson(),
    "error_report": errorReport.toJson(),
    "feedback_support": feedbackSupport.toJson(),
    "google_ads": googleAds.toJson(),
    "facebook_ads": facebookAds.toJson(),
    "custom_ads": customAds.toJson(),
    "app_lovin": appLovin.toJson(),
  };
}

class AboutApp {
  AboutApp({
    required this.isOverride,
    required this.isAboutApp,
    required this.aboutTitle,
    required this.aboutMessage,
    required this.registrationDetail,
    required this.versionDetail,
  });

  bool isOverride;
  bool isAboutApp;
  String aboutTitle;
  String aboutMessage;
  String registrationDetail;
  String versionDetail;

  factory AboutApp.fromJson(Map<String, dynamic> json) => AboutApp(
    isOverride: json["is_override"],
    isAboutApp: json["is_about_app"],
    aboutTitle: json["about_title"],
    aboutMessage: json["about_message"],
    registrationDetail: json["registration_detail"],
    versionDetail: json["version_detail"],
  );

  Map<String, dynamic> toJson() => {
    "is_override": isOverride,
    "is_about_app": isAboutApp,
    "about_title": aboutTitle,
    "about_message": aboutMessage,
    "registration_detail": registrationDetail,
    "version_detail": versionDetail,
  };
}

class AdSetting {
  AdSetting({
    required this.appVersionCode,
    required this.isFullAds,
    required this.onesignalId,
    required this.adsLoadingText,
    required this.secondsRequireTrigerReward,
    required this.globalIntraIntervalClick,
    required this.interstitialAdTimeInterval,
  });

  int appVersionCode;
  bool isFullAds;
  String onesignalId;
  String adsLoadingText;
  int secondsRequireTrigerReward;
  int globalIntraIntervalClick;
  int interstitialAdTimeInterval;

  factory AdSetting.fromJson(Map<String, dynamic> json) => AdSetting(
    appVersionCode: json["app_version_code"],
    isFullAds: json["is_full_ads"],
    onesignalId: json["onesignal_id"],
    adsLoadingText: json["ads_loading_text"],
    secondsRequireTrigerReward: json["seconds_require_triger_reward"],
    globalIntraIntervalClick: json["global_intra_interval_click"],
    interstitialAdTimeInterval: json["interstitial_ad_time_interval"],
  );

  Map<String, dynamic> toJson() => {
    "app_version_code": appVersionCode,
    "is_full_ads": isFullAds,
    "onesignal_id": onesignalId,
    "ads_loading_text": adsLoadingText,
    "seconds_require_triger_reward": secondsRequireTrigerReward,
    "global_intra_interval_click": globalIntraIntervalClick,
    "interstitial_ad_time_interval": interstitialAdTimeInterval,
  };
}

class AppLovin {
  AppLovin({
    required this.idUnitBanner,
    required this.idUnitIntra,
    required this.idUnitNative,
    required this.rewaredAdsUnitId,
    required this.isBannerAds,
    required this.isInterstitialAds,
    required this.isNativeAds,
    required this.isRewaredAds,
  });

  String idUnitBanner;
  String idUnitIntra;
  String idUnitNative;
  String rewaredAdsUnitId;
  bool isBannerAds;
  bool isInterstitialAds;
  bool isNativeAds;
  bool isRewaredAds;

  factory AppLovin.fromJson(Map<String, dynamic> json) => AppLovin(
    idUnitBanner: json["id_unit_banner"],
    idUnitIntra: json["id_unit_intra"],
    idUnitNative: json["id_unit_native"],
    rewaredAdsUnitId: json["rewared_ads_unit_id"],
    isBannerAds: json["is_banner_ads"],
    isInterstitialAds: json["is_interstitial_ads"],
    isNativeAds: json["is_native_ads"],
    isRewaredAds: json["is_rewared_ads"],
  );

  Map<String, dynamic> toJson() => {
    "id_unit_banner": idUnitBanner,
    "id_unit_intra": idUnitIntra,
    "id_unit_native": idUnitNative,
    "rewared_ads_unit_id": rewaredAdsUnitId,
    "is_banner_ads": isBannerAds,
    "is_interstitial_ads": isInterstitialAds,
    "is_native_ads": isNativeAds,
    "is_rewared_ads": isRewaredAds,
  };
}

class AppUpdate {
  AppUpdate({
    required this.isPopupDialog,
    required this.isUpdateRequire,
    required this.packageId,
    required this.websiteUrl,
    required this.appIcon,
    required this.updatedVersionCode,
    required this.title,
    required this.defaultMessage,
  });

  bool isPopupDialog;
  bool isUpdateRequire;
  String packageId;
  String websiteUrl;
  String appIcon;
  int updatedVersionCode;
  String title;
  String defaultMessage;

  factory AppUpdate.fromJson(Map<String, dynamic> json) => AppUpdate(
    isPopupDialog: json["is_popup_dialog"],
    isUpdateRequire: json["is_update_require"],
    packageId: json["package_id"],
    websiteUrl: json["website_url"],
    appIcon: json["app_icon"],
    updatedVersionCode: json["updated_version_code"],
    title: json["title"],
    defaultMessage: json["default_message"],
  );

  Map<String, dynamic> toJson() => {
    "is_popup_dialog": isPopupDialog,
    "is_update_require": isUpdateRequire,
    "package_id": packageId,
    "website_url": websiteUrl,
    "app_icon": appIcon,
    "updated_version_code": updatedVersionCode,
    "title": title,
    "default_message": defaultMessage,
  };
}

class CustomAds {
  CustomAds({
    required this.qurekaLink,
    required this.isQurakaBanner,
    required this.isQurakaIntera,
    required this.closeButtonToDirectWeb,
    required this.qurakaIntraImage,
    required this.qurakaBannerImage,
  });

  String qurekaLink;
  bool isQurakaBanner;
  bool isQurakaIntera;
  bool closeButtonToDirectWeb;
  List<String> qurakaIntraImage;
  List<String> qurakaBannerImage;

  factory CustomAds.fromJson(Map<String, dynamic> json) => CustomAds(
    qurekaLink: json["qureka_link"],
    isQurakaBanner: json["is_quraka_banner"],
    isQurakaIntera: json["is_quraka_intera"],
    closeButtonToDirectWeb: json["close_button_to_direct_web"],
    qurakaIntraImage: List<String>.from(json["quraka_intra_image"].map((x) => x)),
    qurakaBannerImage: List<String>.from(json["quraka_banner_image"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "qureka_link": qurekaLink,
    "is_quraka_banner": isQurakaBanner,
    "is_quraka_intera": isQurakaIntera,
    "close_button_to_direct_web": closeButtonToDirectWeb,
    "quraka_intra_image": List<dynamic>.from(qurakaIntraImage.map((x) => x)),
    "quraka_banner_image": List<dynamic>.from(qurakaBannerImage.map((x) => x)),
  };
}

class ErrorReport {
  ErrorReport({
    required this.isErrorReportSupport,
    required this.emailId,
  });

  bool isErrorReportSupport;
  String emailId;

  factory ErrorReport.fromJson(Map<String, dynamic> json) => ErrorReport(
    isErrorReportSupport: json["is_error_report_support"],
    emailId: json["email_id"],
  );

  Map<String, dynamic> toJson() => {
    "is_error_report_support": isErrorReportSupport,
    "email_id": emailId,
  };
}

class ExitDialog {
  ExitDialog({
    required this.isExitRequire,
    required this.exitTitle,
    required this.exitMessage,
  });

  bool isExitRequire;
  String exitTitle;
  String exitMessage;

  factory ExitDialog.fromJson(Map<String, dynamic> json) => ExitDialog(
    isExitRequire: json["is_exit_require"],
    exitTitle: json["exit_title"],
    exitMessage: json["exit_message"],
  );

  Map<String, dynamic> toJson() => {
    "is_exit_require": isExitRequire,
    "exit_title": exitTitle,
    "exit_message": exitMessage,
  };
}

class FacebookAds {
  FacebookAds({
    required this.bannerAdUnitIdAndroid,
    required this.interstitialAdUnitIdAndroid,
    required this.rewaredAdsUnitId,
    required this.nativeAdsUnitIdAndroid,
    required this.isBannerAds,
    required this.isInterstitialAds,
    required this.isRewaredAds,
    required this.isNativeAds,
  });

  String bannerAdUnitIdAndroid;
  String interstitialAdUnitIdAndroid;
  String rewaredAdsUnitId;
  String nativeAdsUnitIdAndroid;
  bool isBannerAds;
  bool isInterstitialAds;
  bool isRewaredAds;
  bool isNativeAds;

  factory FacebookAds.fromJson(Map<String, dynamic> json) => FacebookAds(
    bannerAdUnitIdAndroid: json["banner_ad_unit_id_android"],
    interstitialAdUnitIdAndroid: json["interstitial_ad_unit_id_android"],
    rewaredAdsUnitId: json["rewared_ads_unit_id"],
    nativeAdsUnitIdAndroid: json["native_ads_unit_id_android"],
    isBannerAds: json["is_banner_ads"],
    isInterstitialAds: json["is_interstitial_ads"],
    isRewaredAds: json["is_rewared_ads"],
    isNativeAds: json["is_native_ads"],
  );

  Map<String, dynamic> toJson() => {
    "banner_ad_unit_id_android": bannerAdUnitIdAndroid,
    "interstitial_ad_unit_id_android": interstitialAdUnitIdAndroid,
    "rewared_ads_unit_id": rewaredAdsUnitId,
    "native_ads_unit_id_android": nativeAdsUnitIdAndroid,
    "is_banner_ads": isBannerAds,
    "is_interstitial_ads": isInterstitialAds,
    "is_rewared_ads": isRewaredAds,
    "is_native_ads": isNativeAds,
  };
}

class FeedbackSupport {
  FeedbackSupport({
    required this.isFeedbackSupport,
    required this.emailId,
    required this.feedbackTitle,
    required this.feedbackMessage,
    required this.emailSubject,
    required this.emailMessage,
  });

  bool isFeedbackSupport;
  String emailId;
  String feedbackTitle;
  String feedbackMessage;
  String emailSubject;
  String emailMessage;

  factory FeedbackSupport.fromJson(Map<String, dynamic> json) => FeedbackSupport(
    isFeedbackSupport: json["is_feedback_support"],
    emailId: json["email_id"],
    feedbackTitle: json["feedback_title"],
    feedbackMessage: json["feedback_message"],
    emailSubject: json["email_subject"],
    emailMessage: json["email_message"],
  );

  Map<String, dynamic> toJson() => {
    "is_feedback_support": isFeedbackSupport,
    "email_id": emailId,
    "feedback_title": feedbackTitle,
    "feedback_message": feedbackMessage,
    "email_subject": emailSubject,
    "email_message": emailMessage,
  };
}

class GoogleAds {
  GoogleAds({
    required this.bannerAdUnitIdAndroid,
    required this.interstitialAdUnitIdAndroid,
    required this.appOpenAdUnitIdAndroid,
    required this.nativeAdsUnitIdAndroid,
    required this.rewaredAdsUnitId,
    required this.nativeVideoAdsUnitIdAndroid,
    required this.isBannerAds,
    required this.isOpenAds,
    required this.isInterstitialAds,
    required this.isRewaredAds,
    required this.isNativeAds,
    required this.noOfClickInterstitial,
  });

  String bannerAdUnitIdAndroid;
  String interstitialAdUnitIdAndroid;
  String appOpenAdUnitIdAndroid;
  String nativeAdsUnitIdAndroid;
  String rewaredAdsUnitId;
  String nativeVideoAdsUnitIdAndroid;
  bool isBannerAds;
  bool isOpenAds;
  bool isInterstitialAds;
  bool isRewaredAds;
  bool isNativeAds;
  int noOfClickInterstitial;

  factory GoogleAds.fromJson(Map<String, dynamic> json) => GoogleAds(
    bannerAdUnitIdAndroid: json["banner_ad_unit_id_android"],
    interstitialAdUnitIdAndroid: json["interstitial_ad_unit_id_android"],
    appOpenAdUnitIdAndroid: json["app_open_ad_unit_id_android"],
    nativeAdsUnitIdAndroid: json["native_ads_unit_id_android"],
    rewaredAdsUnitId: json["rewared_ads_unit_id"],
    nativeVideoAdsUnitIdAndroid: json["native_video_ads_unit_id_android"],
    isBannerAds: json["is_banner_ads"],
    isOpenAds: json["is_open_ads"],
    isInterstitialAds: json["is_interstitial_ads"],
    isRewaredAds: json["is_rewared_ads"],
    isNativeAds: json["is_native_ads"],
    noOfClickInterstitial: json["no_of_click_interstitial"],
  );

  Map<String, dynamic> toJson() => {
    "banner_ad_unit_id_android": bannerAdUnitIdAndroid,
    "interstitial_ad_unit_id_android": interstitialAdUnitIdAndroid,
    "app_open_ad_unit_id_android": appOpenAdUnitIdAndroid,
    "native_ads_unit_id_android": nativeAdsUnitIdAndroid,
    "rewared_ads_unit_id": rewaredAdsUnitId,
    "native_video_ads_unit_id_android": nativeVideoAdsUnitIdAndroid,
    "is_banner_ads": isBannerAds,
    "is_open_ads": isOpenAds,
    "is_interstitial_ads": isInterstitialAds,
    "is_rewared_ads": isRewaredAds,
    "is_native_ads": isNativeAds,
    "no_of_click_interstitial": noOfClickInterstitial,
  };
}

class PrivacyPolicy {
  PrivacyPolicy({
    required this.isPrivacyPolicy,
    required this.isSystemBrowser,
    required this.privacyPolicy,
  });

  bool isPrivacyPolicy;
  bool isSystemBrowser;
  String privacyPolicy;

  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) => PrivacyPolicy(
    isPrivacyPolicy: json["is_privacy_policy"],
    isSystemBrowser: json["is_system_browser"],
    privacyPolicy: json["privacy_policy"],
  );

  Map<String, dynamic> toJson() => {
    "is_privacy_policy": isPrivacyPolicy,
    "is_system_browser": isSystemBrowser,
    "privacy_policy": privacyPolicy,
  };
}

class RateApp {
  RateApp({
    required this.isRateApp,
    required this.packageId,
    required this.rateAppUrl,
    required this.rateMessage,
  });

  bool isRateApp;
  String packageId;
  String rateAppUrl;
  String rateMessage;

  factory RateApp.fromJson(Map<String, dynamic> json) => RateApp(
    isRateApp: json["is_rate_app"],
    packageId: json["package_id"],
    rateAppUrl: json["rate_app_url"],
    rateMessage: json["rate_message"],
  );

  Map<String, dynamic> toJson() => {
    "is_rate_app": isRateApp,
    "package_id": packageId,
    "rate_app_url": rateAppUrl,
    "rate_message": rateMessage,
  };
}

class RewardDialog {
  RewardDialog({
    required this.isRewardRequire,
    required this.rewardMessage,
  });

  bool isRewardRequire;
  String rewardMessage;

  factory RewardDialog.fromJson(Map<String, dynamic> json) => RewardDialog(
    isRewardRequire: json["is_reward_require"],
    rewardMessage: json["reward_message"],
  );

  Map<String, dynamic> toJson() => {
    "is_reward_require": isRewardRequire,
    "reward_message": rewardMessage,
  };
}

class ShareApp {
  ShareApp({
    required this.isShareApp,
    required this.shareTitle,
    required this.shareMessage,
  });

  bool isShareApp;
  String shareTitle;
  String shareMessage;

  factory ShareApp.fromJson(Map<String, dynamic> json) => ShareApp(
    isShareApp: json["is_share_app"],
    shareTitle: json["share_title"],
    shareMessage: json["share_message"],
  );

  Map<String, dynamic> toJson() => {
    "is_share_app": isShareApp,
    "share_title": shareTitle,
    "share_message": shareMessage,
  };
}

class TermsOfUse {
  TermsOfUse({
    required this.isTermsOfUse,
    required this.isSystemBrowser,
    required this.termsOfUse,
  });

  bool isTermsOfUse;
  bool isSystemBrowser;
  String termsOfUse;

  factory TermsOfUse.fromJson(Map<String, dynamic> json) => TermsOfUse(
    isTermsOfUse: json["is_terms_of_use"],
    isSystemBrowser: json["is_system_browser"],
    termsOfUse: json["terms_of_use"],
  );

  Map<String, dynamic> toJson() => {
    "is_terms_of_use": isTermsOfUse,
    "is_system_browser": isSystemBrowser,
    "terms_of_use": termsOfUse,
  };
}
