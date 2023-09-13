import 'package:flutter/material.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: getProportionateScreenWidth(48),
      minWidth: double.infinity,
      color: Constants.kMainButtonsColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      highlightElevation: 0,
      child: Text(
        title,
        style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Constants.kMainFontColorOnButtons),
      ),
    );
  }
}
