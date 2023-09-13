import 'package:flutter/material.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';

class HotelAddressButton extends StatelessWidget {
  const HotelAddressButton({super.key, required this.adress});
  final String adress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
      child: Text(
        '$adress ',
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: getProportionateScreenWidth(14), fontWeight: FontWeight.w500, color: Constants.kSecondaryFontColorOnButtons),
      ),
    );
  }
}
