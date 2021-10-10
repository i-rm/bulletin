import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialization;
  AdState(this.initialization);

  String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/6300978111';

  BannerAdListener get adListener => _adListener;
  BannerAdListener _adListener = BannerAdListener(
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      print("ERR: " + error.toString());
      ad.dispose();
    },
  );
}
