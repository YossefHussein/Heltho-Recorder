import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3816989531658757/9318730399';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3816989531658757/9278421695';
    } else {
      throw UnsupportedError('Unsupported platform for banner ads');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3816989531658757/9621982720';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3816989531658757/2338389075';
    } else {
      throw UnsupportedError('Unsupported platform for interstitial ads');
    }
  }

  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3816989531658757/5678088033';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3816989531658757/6432766509';
    } else {
      throw UnsupportedError('Unsupported platform for rewarded ads');
    }
  }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad Loaded'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load $error');
    },
    onAdClosed: (ad) => debugPrint('Ad closed'),
  );
}
