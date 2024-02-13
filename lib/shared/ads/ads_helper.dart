// ad_helper.dart
import 'dart:io';


class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3816989531658757~4034758944';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3816989531658757~7664066083';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}

// --- Call like this ----
// var _bannerAd = BannerAd(
//   adUnitId: AdHelper.bannerAdUnitId,
// );