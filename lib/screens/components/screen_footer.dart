import 'package:flutter/material.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';
import 'package:test_task_for_job/screens/components/main_button.dart';

class ScreenFooter extends StatelessWidget {
  const ScreenFooter({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
  });

  final String buttonTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: getProportionateScreenWidth(8),bottom: getProportionateScreenWidth(16)),
      decoration: const BoxDecoration(
          color: Constants.kMainBackgroundColor,
          border: Border(
            top: BorderSide(width: 1, color: Constants.kBorderColor),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        child: SizedBox(
          height: getProportionateScreenWidth(48),
          child: MainButton(
            title: buttonTitle,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
