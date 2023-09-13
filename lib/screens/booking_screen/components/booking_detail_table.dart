import 'package:flutter/material.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';

class BookingDetailTable extends StatelessWidget {
  const BookingDetailTable({
    super.key,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.hotelName,
    required this.room,
    required this.nutrition,
  });
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final int numberOfNights;
  final String hotelName;
  final String room;
  final String nutrition;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.kMainBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenWidth(16)),
            Table(
              columnWidths: <int, TableColumnWidth>{0: const IntrinsicColumnWidth(flex: 1), 1: FixedColumnWidth(getProportionateScreenWidth(200))},
              children: [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: getProportionateScreenWidth(8)),
                    child: Text(
                      'Вылет из',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Constants.kSecondaryFontColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: getProportionateScreenWidth(8)),
                    child: Text(
                      departure,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                    child: Text(
                      'Страна, город',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Constants.kSecondaryFontColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                    child: Text(
                      arrivalCountry,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                    child: Text(
                      'Даты',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Constants.kSecondaryFontColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                    child: Text(
                      '$tourDateStart - $tourDateStop',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                    child: Text(
                      'Кол-во ночей',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Constants.kSecondaryFontColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                    child: Text(
                      '$numberOfNights ночей',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                    child: Text(
                      'Отель',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Constants.kSecondaryFontColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                    child: Text(
                      hotelName,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                    child: Text(
                      'Номер',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Constants.kSecondaryFontColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                    child: Text(
                      room,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(top: getProportionateScreenWidth(8)),
                    child: Text(
                      'Питание',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Constants.kSecondaryFontColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getProportionateScreenWidth(8)),
                    child: Text(
                      nutrition,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(16)),
          ],
        ),
      ),
    );
  }
}
