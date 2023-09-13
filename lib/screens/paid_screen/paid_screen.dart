import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';
import 'package:test_task_for_job/screens/components/screen_footer.dart';
import 'package:test_task_for_job/screens/hotel_screen/hotel_screen.dart';

class PaidScreen extends StatelessWidget {
  const PaidScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    var randomValue = Random().nextInt(1000000);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Colors.white),
      body: Container(
        color: Constants.kMainBackgroundColor,
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/paidScreen.png',
              width: getProportionateScreenWidth(94),
              height: getProportionateScreenWidth(94),
            ),
            SizedBox(height: getProportionateScreenWidth(32)),
            Text(
              'Ваш заказ принят в работу',
              textAlign: TextAlign.center,
              style: TextStyle(color: Constants.kMainFontColor, fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.w500),
            ),
            SizedBox(height: getProportionateScreenWidth(16)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
              child: Text(
                'Подтверждение заказа № $randomValue может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                textAlign: TextAlign.center,
                style:const TextStyle(color: Constants.kSecondaryFontColor),
              ),
            ),
            const Spacer(),
            ScreenFooter(
              buttonTitle: 'Супер!',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HotelScreen(
                      title: '',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
