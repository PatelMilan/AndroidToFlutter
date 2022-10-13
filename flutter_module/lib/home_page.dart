import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  Create Instance of BannerAd
  BannerAd? _bannerAd;
  NativeAd? _nativeAd;

  @override
  void initState() {
    //  Initialization of Banner Ad
    BannerAd(
            size: AdSize.banner,
            adUnitId: 'ca-app-pub-3940256099942544/6300978111',
            listener: BannerAdListener(
              onAdFailedToLoad: (ad, error) {
                print('Banner Ad Loading to fail ${error.message}');
                ad.dispose();
              },
              onAdLoaded: (ad) {
                setState(() {
                  _bannerAd = ad as BannerAd;
                });
                print("Banner Ad Is Loading...");
              },
            ),
            request: const AdRequest())
        .load();

    //  Initialization of NativeAd
    NativeAd(
            adUnitId: 'ca-app-pub-3940256099942544/2247696110',
            factoryId: 'admob_native_ads',
            listener: NativeAdListener(
              onAdLoaded: (ad) {
                print('Native Ad is Loaded...');
                setState(() {
                  _nativeAd = ad as NativeAd;
                });
              },
              onAdFailedToLoad: (ad, error) {
                print('NativeAd Loading To Fail : ${error.message}');
                ad.dispose();
              },
            ),
            request: const AdRequest())
        .load();

    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Module'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          const Text(
            'Banner Ad',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              wordSpacing: 2,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: _bannerAd?.size.width.toDouble(),
                height: _bannerAd?.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!)),
          ),
          const SizedBox(height: 20),
          const Text(
            'Native Ad',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              wordSpacing: 2,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: AdWidget(ad: _nativeAd!),
            ),
          ),
        ],
      ),
    );
  }
}
