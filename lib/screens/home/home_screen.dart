import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constant/constant.dart';
import '../../styles/app_colors.dart';
import '../../styles/app_theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
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
                statusBarColor: const Color(AppColor.primaryColor),
              ),
            ),
            backgroundColor: Colors.white,
            body: Container()));
  }
}
