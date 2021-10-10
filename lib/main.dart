import 'package:bulletin/helpers/candidates.dart';
import 'package:bulletin/provider/ad_state.dart';
import 'package:bulletin/provider/provider.dart';
import 'package:bulletin/widgets/candidate/candidate.dart';
import 'package:bulletin/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckProvider()),
        Provider(create: (context) => AdState(initFuture)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BannerAd banner;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();

    final adState = Provider.of<AdState>(context, listen: false);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: const AdRequest(),
          listener: adState.adListener,
        )..load();
        _isAdLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckProvider>(
      builder: (context, checkProvider, child) {
        return Scaffold(
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(2),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListView(
                    shrinkWrap: true,
                    children: [
                      const Header(),
                      for (var c in candidates)
                        Candidate(
                          logo: c.logo,
                          text: c.text,
                          n: c.n,
                        ),
                    ],
                  ),
                  if (!_isAdLoaded)
                    const SizedBox(
                      height: 50,
                    )
                  else
                    Container(
                      height: 50,
                      child: AdWidget(
                        ad: banner,
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
