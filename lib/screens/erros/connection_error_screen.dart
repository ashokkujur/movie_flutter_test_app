import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../constant/constant.dart';
import '../../styles/app_theme.dart';
import '../../styles/text_style.dart';

class ConnectionErrorScreen extends StatefulWidget {
  const ConnectionErrorScreen({Key? key}) : super(key: key);

  @override
  ConnectionErrorState createState() => ConnectionErrorState();
}

class ConnectionErrorState extends State<ConnectionErrorScreen> {
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
              systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              ),
            ),
            body: SafeArea(
                child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                alignment: FractionalOffset.center,
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Internet connection not available.",
                        style: AppTextStyle.size18ColorBlack,
                        textAlign: TextAlign.center,
                      )
                    ]),
              ),
            ))));
  }
}
