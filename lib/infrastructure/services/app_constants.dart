import 'package:flutter_remix/flutter_remix.dart';
class AppConstants {
  AppConstants._();

  static const bool appStoreMode = true;
  static const bool demoMode = true;

  /// shared preferences keys
  static const String keyUser = 'keyUser';
  static const String keyBags = 'keyBags';
  static const String keyShop = 'keyShop';
  static const String keyToken = 'keyToken';
  static const String keyWallet = 'keyWallet';
  static const String keyLangLtr = 'keyLangLtr';
  static const String keyAppThemeMode = 'keyAppThemeMode';
  static const String keyTranslations = 'keyTranslations';
  static const String keyLanguageData = 'keyLanguageData';
  static const String keyGlobalSettings = 'keyGlobalSettings';
  static const String keySystemLanguage = 'keySystemLanguage';
  static const String keyAddressSelected = 'keyAddressSelected';
  static const String keySelectedCurrency = 'keySelectedCurrency';

  /// api urls

  static const String baseUrl = 'https://api.demand24.org/';
  static const String webUrl = 'https://demand24.org';
  static const String imageBaseUrl = '$baseUrl/storage/images';
  static const String adminPageUrl = 'https://admin.demand24.org';
  static const String googleApiKey = 'AIzaSyAV3BYPU2xncEElk74aKVJtSRTf4oPY7eE';
  static const String initialCountryCode = '+1';

  /// location
  static const double demoLatitude = 41.304223;
  static const double demoLongitude = 69.2348277;
  static const double pinLoadingMin = 0.116666667;
  static const double pinLoadingMax = 0.611111111;

  static const int smsTime = 45;
  static const double radius = 12;
  static const Duration animationDuration = Duration(milliseconds: 375);

  /// demo app info
  // static const String demoSellerLogin = 'H&M@gmail.com';
  // static const String demoSellerPassword = 'githubit';
  static const String demoSellerLogin = 'sellers@githubit.com';
  static const String demoSellerPassword = 'seller';
  static const String demoMasterLogin = 'master@githubit.com';
  static const String demoMasterPassword = 'master';
  static const String demoAdminLogin = 'owner@githubit.com';
  static const String demoAdminPassword = 'githubit';

  // notification
  static const String newOrder = 'new_order';
  static const String newParcelOrder = 'new_parcel_order';
  static const String newUserByReferral = 'new_user_by_referral';
  static const String statusChanged = 'status_changed';
  static const String newsPublish = 'news_publish';
  static const String addCashback = 'add_cashback';
  static const String shopApproved = 'shop_approved';

  static const socialIcon = {
    "facebook": FlutterRemix.facebook_fill,
    "instagram": FlutterRemix.instagram_fill,
    "telegram": FlutterRemix.telegram_fill,
    "youtube": FlutterRemix.youtube_fill,
    "linkedin": FlutterRemix.linkedin_fill,
    "snapchat": FlutterRemix.snapchat_fill,
    "wechat": FlutterRemix.wechat_fill,
    "whatsapp": FlutterRemix.whatsapp_fill,
    "twitch": FlutterRemix.twitch_fill,
    "discord": FlutterRemix.discord_fill,
    "pinterest": FlutterRemix.pinterest_fill,
    "steam": FlutterRemix.steam_fill,
    "spotify": FlutterRemix.spotify_fill,
    "reddit": FlutterRemix.reddit_fill,
    "skype": FlutterRemix.skype_fill,
    "twitter": FlutterRemix.twitter_fill,
  };

  static const int hoursADay = 24;
  static const int minutesADay = 1440;
}
