import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_task_for_job/helpers/size_config.dart';

class HotelScreenShimmer extends StatelessWidget {
  const HotelScreenShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: getProportionateScreenWidth(257),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(
              height: getProportionateScreenWidth(16),
            ),
            Container(
              height: getProportionateScreenWidth(25),
              width: getProportionateScreenWidth(150),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            ),
            SizedBox(
              height: getProportionateScreenWidth(16),
            ),
            Container(
              height: getProportionateScreenWidth(25),
              width: getProportionateScreenWidth(250),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(16),
            ),
            Container(
              height: getProportionateScreenWidth(25),
              width: getProportionateScreenWidth(350),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(16),
            ),
            Container(
              height: getProportionateScreenWidth(30),
              width: getProportionateScreenWidth(350),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(16),
            ),
            Container(
              height: getProportionateScreenWidth(25),
              width: getProportionateScreenWidth(100),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(16),
            ),
            Container(
              height: getProportionateScreenWidth(25),
              width: getProportionateScreenWidth(350),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(16),
            ),
            Container(
              height: getProportionateScreenWidth(25),
              width: getProportionateScreenWidth(350),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(48),
            ),
            Container(
              height: getProportionateScreenWidth(48),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
