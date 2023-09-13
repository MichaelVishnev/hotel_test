
import 'package:flutter/material.dart';
import 'package:test_task_for_job/helpers/size_config.dart';

import 'constants.dart';

List<Widget> tags(quantity, pecularities) {
  return List.generate(quantity, (index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenWidth(5)),
      decoration: BoxDecoration(
        color: Constants.kTagBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        pecularities[index],
        style: const TextStyle(color: Constants.kSecondaryFontColor),
      ),
    );
  });
}
