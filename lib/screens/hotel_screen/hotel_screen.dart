import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';
import 'package:test_task_for_job/helpers/tags_builder_function.dart';
import 'package:test_task_for_job/providers/hotel_images_slider_provider/hotel_screen_images_provider.dart';
import 'package:test_task_for_job/riverpod/hotel_screen_provider/hotel_screen_provider.dart';
import 'package:test_task_for_job/screens/components/screen_footer.dart';
import 'package:test_task_for_job/screens/hotel_rooms/hotel_rooms_screen.dart';
import 'components/divider.dart';
import 'components/hotel_address_button.dart';
import 'components/hotel_rating.dart';
import 'components/hotel_screen_shimmer.dart';
import 'components/options_button.dart';
import 'package:intl/intl.dart';

class HotelScreen extends ConsumerWidget {
  HotelScreen({
    super.key,
    required this.title,
  });
  final String title;
  final currencyFormat = NumberFormat("#,##0 00", "ru-RU");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: Constants.kSecondaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.kMainBackgroundColor,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, color: Constants.kMainFontColor)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: pageController,
              child: Consumer(
                builder: (context, ref, child) => ref.watch(hotelScreenProvider).maybeWhen(
                      orElse: () => const SizedBox(),
                      loading: () => SizedBox(
                        height: getProportionateScreenWidth(800),
                        child: const HotelScreenShimmer(),
                      ),
                      done: (model) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Constants.kMainBackgroundColor,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                            ),
                            child: Column(
                              children: [
                                Stack(children: [
                                  SizedBox(
                                    height: getProportionateScreenWidth(257),
                                    child: PageView.builder(
                                        itemCount: model.imageUrls.length,
                                        pageSnapping: true,
                                        controller: pageController,
                                        onPageChanged: (page) {
                                          ref.read(hotelScreenImagesProvider.notifier).state = page;
                                        },
                                        itemBuilder: (context, pagePosition) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15.0),
                                              child: Image.network(model.imageUrls[pagePosition], fit: BoxFit.fill),
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
                                              activeIndex: ref.watch(hotelScreenImagesProvider),
                                              count: model.imageUrls.length,
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
                                  padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
                                  child: HotelRating(
                                    rating: '${model.rating}',
                                    ratingName: '${model.ratingName}',
                                  ),
                                ),
                                SizedBox(height: getProportionateScreenWidth(16)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${model.name} ',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.w500),
                                      ),
                                      HotelAddressButton(adress: '${model.adress}'),
                                      SizedBox(height: getProportionateScreenWidth(16)),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'от ${currencyFormat.format(model.minimalPrice)} ₽ ',
                                            style: TextStyle(fontSize: getProportionateScreenWidth(30), fontWeight: FontWeight.w600, height: 0.5),
                                          ),
                                          Text(
                                            '${model.priceForIt}',
                                            style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Constants.kSecondaryFontColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: getProportionateScreenWidth(16)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: getProportionateScreenWidth(8)),
                          Container(
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
                                  Text(
                                    'Об отеле',
                                    style: TextStyle(fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: getProportionateScreenWidth(16)),
                                  Wrap(
                                    spacing: getProportionateScreenWidth(8),
                                    runSpacing: getProportionateScreenWidth(8),
                                    children: <Widget>[...tags(model.aboutTheHotel?.peculiarities?.length, model.aboutTheHotel?.peculiarities)],
                                  ),
                                  SizedBox(height: getProportionateScreenWidth(16)),
                                  Text(
                                    '${model.aboutTheHotel?.description}',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(16),
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenWidth(16)),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Column(
                                      children: [
                                        const OptionsButton(title: 'Удобства', buttonDescription: 'Самое необходимое', buttonImage: 'assets/icons/emoji_happy.svg'),
                                        Padding(
                                          padding: EdgeInsets.only(left: getProportionateScreenWidth(40), right: getProportionateScreenWidth(16)),
                                          child: const MyDivider(),
                                        ),
                                        const OptionsButton(title: 'Что включено', buttonDescription: 'Самое необходимое', buttonImage: 'assets/icons/tick_square.svg'),
                                        Padding(
                                          padding: EdgeInsets.only(left: getProportionateScreenWidth(40), right: getProportionateScreenWidth(16)),
                                          child: const MyDivider(),
                                        ),
                                        const OptionsButton(title: 'Что не включено', buttonDescription: 'Самое необходимое', buttonImage: 'assets/icons/close_square.svg')
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenWidth(16)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenWidth(8)),
                        ],
                      ),
                    ),
              ),
            ),
          ),
         ScreenFooter(
                    buttonTitle: 'К выбору номера',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HotelRoomsScreen(
                            title: '',
                          ),
                        ),
                      );
                    },
                  ),

        ],
      ),
    );
  }
}
