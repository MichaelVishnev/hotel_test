import 'package:flutter/material.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';
import 'package:test_task_for_job/screens/hotel_screen/components/hotel_address_button.dart';
import 'package:test_task_for_job/screens/hotel_screen/components/hotel_rating.dart';

class BookingScreenHeader extends StatelessWidget {
  const BookingScreenHeader({
    super.key,
    required this.horating,
    required this.ratingName,
    required this.hotelName,
    required this.hotelAdress,
  });
  final int horating;
  final String ratingName;
  final String hotelName;
  final String hotelAdress;

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
            HotelRating(rating: '$horating', ratingName: ratingName),
            SizedBox(height: getProportionateScreenWidth(8)),
            Text('$hotelName ', textAlign: TextAlign.start, style: TextStyle(fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.w500)),
            HotelAddressButton(adress: hotelAdress),
          ],
        ),
      ),
    );
  }
}
