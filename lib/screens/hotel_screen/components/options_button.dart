import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task_for_job/helpers/size_config.dart';

import '../../../helpers/constants.dart';

class OptionsButton extends StatelessWidget {
  const OptionsButton({
    super.key,
    required this.title,
    required this.buttonDescription,
    required this.buttonImage,
  });
  final String title;
  final String buttonDescription;
  final String buttonImage;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: getProportionateScreenWidth(60),
      color: Constants.kTagBackgroundColor,
      elevation: 0,
      padding: EdgeInsets.all(getProportionateScreenWidth(16)),
      highlightElevation: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Row(
        children: [
          SvgPicture.asset(
            buttonImage,
            width: getProportionateScreenWidth(24),
            height: getProportionateScreenWidth(24),
          ),
          SizedBox(
            width: getProportionateScreenWidth(16),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: getProportionateScreenWidth(16)),
              ),
              Text(buttonDescription, style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Constants.kSecondaryFontColor)),
            ],
          ),
          const Spacer(),
          Icon(Icons.keyboard_arrow_right, size: getProportionateScreenWidth(24)),
        ],
      ),
    );
  }
}
