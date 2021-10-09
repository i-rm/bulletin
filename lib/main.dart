import 'package:bulletin/helpers/candidates.dart';
import 'package:bulletin/provider/provider.dart';
import 'package:bulletin/widgets/candidate/candidate.dart';
import 'package:bulletin/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ChangeNotifierProvider(
    create: (context) => CheckProvider(),
    child: const MyApp(),
  ));
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
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckProvider>(
      builder: (context, checkProvider, child) {
        return Scaffold(
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(3),
              height: MediaQuery.of(context).size.height - 30,
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
