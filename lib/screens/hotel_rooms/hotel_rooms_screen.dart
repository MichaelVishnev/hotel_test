import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';
import 'package:test_task_for_job/helpers/tags_builder_function.dart';
import 'package:test_task_for_job/providers/hotel_images_slider_provider/hotel_screen_images_provider.dart';
import 'package:test_task_for_job/riverpod/hotel_rooms_screen_provider/hotel_rooms_screen_provider.dart';
import 'package:test_task_for_job/riverpod/hotel_screen_provider/hotel_screen_provider.dart';
import 'package:test_task_for_job/screens/booking_screen/booking_screen.dart';
import 'package:test_task_for_job/screens/components/main_button.dart';
import 'package:intl/intl.dart';

class HotelRoomsScreen extends ConsumerWidget {
  HotelRoomsScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  final currencyFormat = NumberFormat("#,##0 00", "ru-RU");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController();
    return Scaffold(
      appBar: AppBar(
          title: Text(
            ref.read(hotelScreenProvider).maybeWhen(
                  orElse: () => '',
                  done: (model) => '${model.name}',
                ),
            // title,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Colors.white),
      body: Consumer(
          builder: (BuildContext context, WidgetRef ref, child) => ref.watch(hotelRoomsScreenProvider).maybeWhen(
                orElse: () => const SizedBox(),
                done: (model) => ListView.builder(
                  itemCount: model.rooms?.length,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getProportionateScreenWidth(8),
                      ),
                      Container(
                        height: getProportionateScreenWidth(550),
                        decoration: BoxDecoration(
                          color: Constants.kMainBackgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(16)),
                          child: Column(
                            children: [
                              Stack(children: [
                                SizedBox(
                                  height: getProportionateScreenWidth(255),
                                  child: PageView.builder(
                                      itemCount: model.rooms?[index].imageUrls?.length,
                                      pageSnapping: true,
                                      controller: pageController,
                                      onPageChanged: (page) {
                                        ref.read(hotelRoomsScreenImagesProvider(index).notifier).state = page;

                                        ///**********************************************
                                      },
                                      itemBuilder: (context, pagePosition) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.network(model.rooms![index].imageUrls![pagePosition], fit: BoxFit.fill),
                                          ),
                                        );
                                      }),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: getProportionateScreenWidth(10),
                                            vertical: getProportionateScreenWidth(5),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          child: AnimatedSmoothIndicator(
                                            activeIndex: ref.watch(hotelRoomsScreenImagesProvider(index)),

                                            ///***********************************************
                                            count: model.rooms![index].imageUrls!.length,
                                            effect: CustomizableEffect(
                                              spacing: getProportionateScreenWidth(7),
                                              inActiveColorOverride: (i) {
                                                return Colors.black.withOpacity(double.parse("0.${i + 1}"));
                                              },
                                              dotDecoration: DotDecoration(
                                                color: Colors.black.withOpacity(0.22),
                                                height: getProportionateScreenWidth(7),
                                                width: getProportionateScreenWidth(7),
                                                borderRadius: BorderRadius.circular(getProportionateScreenWidth(7)),
                                              ),
                                              activeDotDecoration: DotDecoration(
                                                color: Colors.black,
                                                height: getProportionateScreenWidth(7),
                                                width: getProportionateScreenWidth(7),
                                                borderRadius: BorderRadius.circular(getProportionateScreenWidth(7)),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ]),
                              SizedBox(height: getProportionateScreenWidth(16)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${model.rooms![index].name} ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: getProportionateScreenWidth(16)),
                                    Wrap(
                                      spacing: getProportionateScreenWidth(8),
                                      runSpacing: getProportionateScreenWidth(8),
                                      children: <Widget>[...tags(model.rooms![index].peculiarities?.length, model.rooms![index].peculiarities)],
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                                      child: Container(
                                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                        decoration: BoxDecoration(
                                          color: Constants.kSecondaryButtonsColor,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Подробнее о номере ',
                                              textAlign: TextAlign.start,
                                              style:
                                                  TextStyle(fontSize: getProportionateScreenWidth(16), fontWeight: FontWeight.w500, color: Constants.kSecondaryFontColorOnButtons),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              color: Constants.kMainButtonsColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: getProportionateScreenWidth(16)),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'от ${currencyFormat.format(model.rooms![index].price)}₽ ',
                                          style: TextStyle(fontSize: getProportionateScreenWidth(30), fontWeight: FontWeight.w600, height: 0.5),
                                        ),
                                        Text(
                                          '${model.rooms![index].pricePer}',
                                          style: TextStyle(fontSize: getProportionateScreenWidth(14), color: Constants.kSecondaryFontColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: getProportionateScreenWidth(16)),
                                    MainButton(
                                      title: 'Выбрать номер',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) => const BookingScreen(
                                              title: 'Бронирование',
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
