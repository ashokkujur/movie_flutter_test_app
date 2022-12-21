import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_flutter_test_app/routes/app_route_names.dart';
import 'package:movie_flutter_test_app/styles/app_colors.dart';
import 'package:movie_flutter_test_app/styles/app_theme.dart';
import 'package:movie_flutter_test_app/styles/text_style.dart';

import 'constant/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashScreen> {
  get appName => null;

  @override
  void initState() {
    InitTimer._().initialize().then((value) async {
      Navigator.pushReplacementNamed(context, AppRouterNames.home);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConstant.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              toolbarHeight: 0.0,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Color(AppColor.primaryColor),
              ),
            ),
            backgroundColor: Color(AppColor.primaryColor),
            body: Container(
              alignment: FractionalOffset.center,
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Movie Test App",
                      style: AppTextStyle.size24ColorWhite,
                      textAlign: TextAlign.center,
                    )
                  ]),
            )));
  }
}

class InitTimer {
  InitTimer._();
  static final instance = InitTimer._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 6));
  }
}
