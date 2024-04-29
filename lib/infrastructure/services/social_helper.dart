import 'package:flutter_remix/flutter_remix.dart';
import 'services.dart';

abstract class SocialHelper {
  SocialHelper._();

  static const icons = {
    TrKeys.facebook: FlutterRemix.facebook_fill,
    TrKeys.instagram: FlutterRemix.instagram_fill,
    TrKeys.telegram: FlutterRemix.telegram_fill,
    TrKeys.youtube: FlutterRemix.youtube_fill,
    TrKeys.linkedin: FlutterRemix.linkedin_fill,
    TrKeys.snapchat: FlutterRemix.snapchat_fill,
    TrKeys.wechat: FlutterRemix.wechat_fill,
    TrKeys.whatsapp: FlutterRemix.whatsapp_fill,
    TrKeys.twitch: FlutterRemix.twitch_fill,
    TrKeys.discord: FlutterRemix.discord_fill,
    TrKeys.pinterest: FlutterRemix.pinterest_fill,
    TrKeys.steam: FlutterRemix.steam_fill,
    TrKeys.spotify: FlutterRemix.spotify_fill,
    TrKeys.reddit: FlutterRemix.reddit_fill,
    TrKeys.skype: FlutterRemix.skype_fill,
    TrKeys.twitter: FlutterRemix.twitter_fill,
  };

  static const sites = {
    TrKeys.facebook: "https://www.facebook.com/",
    TrKeys.instagram: "https://www.instagram.com/",
    TrKeys.telegram: "https://t.me/",
    TrKeys.youtube: "https://www.youtube.com/",
    TrKeys.linkedin: "https://www.linkedin.com/in/",
    TrKeys.snapchat: FlutterRemix.snapchat_fill,
    TrKeys.wechat: FlutterRemix.wechat_fill,
    TrKeys.whatsapp: FlutterRemix.whatsapp_fill,
    TrKeys.twitch: FlutterRemix.twitch_fill,
    TrKeys.discord: FlutterRemix.discord_fill,
    TrKeys.pinterest: FlutterRemix.pinterest_fill,
    TrKeys.steam: FlutterRemix.steam_fill,
    TrKeys.spotify: FlutterRemix.spotify_fill,
    TrKeys.reddit: FlutterRemix.reddit_fill,
    TrKeys.skype: 'https://www.skype.com/',
    TrKeys.twitter: "https://twitter.com/",
  };
}
