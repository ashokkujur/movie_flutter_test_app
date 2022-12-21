import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter_test_app/styles/app_colors.dart';

class AppLoadingWhiteWidget extends StatelessWidget {
  const AppLoadingWhiteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(Color(AppColor.primaryColor)),
      ),
    );
  }
}
