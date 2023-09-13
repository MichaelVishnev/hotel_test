import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';

class HotelRating extends StatelessWidget {
  const HotelRating({
    super.key,
    required this.rating,
    required this.ratingName
  });

  final String rating;
  final String ratingName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenWidth(5)),
          decoration: BoxDecoration(
            color: Constants.kRatingBackgroundColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/rating_star.svg',
                width: 15,
                height: 15,
              ),
              Text(
                rating,
                style: TextStyle(color: Constants.kRatingTextColor, fontSize: getProportionateScreenWidth(16), fontWeight: FontWeight.w500),
              ),
              Text(
                ' $ratingName',
                style: TextStyle(color: Constants.kRatingTextColor, fontSize: getProportionateScreenWidth(16), fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
