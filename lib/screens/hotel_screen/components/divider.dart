import 'package:flutter/material.dart';
import 'package:test_task_for_job/helpers/constants.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Constants.kDividerColor,
      thickness: 1,
      height: 0,
    );
  }
}
