import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';
import 'package:test_task_for_job/models/tourist/tourist.dart';
import 'package:test_task_for_job/riverpod/booking_screen_provider/booking_screen_provider.dart';
import 'package:test_task_for_job/riverpod/tourist_card_provider/tourist_card_provider.dart';
import 'package:test_task_for_job/screens/components/screen_footer.dart';
import 'package:test_task_for_job/screens/paid_screen/paid_screen.dart';
import 'components/booking_detail_table.dart';
import 'components/booking_screen_header.dart';
import 'components/tourist_card.dart';
import 'package:intl/intl.dart';

List<Tourist> tourists = [
  Tourist(
    touristName: '',
    surname: '',
    birtDate: '',
    citizenship: '',
    internationalPassportNumber: '',
    internationalPassportExpireDate: '',
  ),
];

class BookingScreen extends ConsumerStatefulWidget {
  const BookingScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _myTextController = TextEditingController();
  final TextEditingController _myEmailController = TextEditingController();

  final currencyFormat = NumberFormat("#,##0 00", "ru-RU");

  @override
  void initState() {
    super.initState();
    enterPhoneNumber('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Colors.white),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                child: Consumer(
                  builder: (BuildContext context, WidgetRef ref, child) => ref.watch(bookingScreenProvider).maybeWhen(
                        orElse: () => const SizedBox(),
                        done: (model) => Column(
                          children: [
                            BookingScreenHeader(
                              horating: model.horating as int,
                              ratingName: '${model.ratingName}',
                              hotelName: '${model.hotelName}',
                              hotelAdress: '${model.hotelAdress}',
                            ),
                            SizedBox(height: getProportionateScreenWidth(8)),
                            BookingDetailTable(
                              departure: '${model.departure}',
                              arrivalCountry: '${model.arrivalCountry}',
                              tourDateStart: '${model.tourDateStart}',
                              tourDateStop: '${model.tourDateStop}',
                              numberOfNights: model.numberOfNights as int,
                              hotelName: '${model.hotelName}',
                              room: '${model.room}',
                              nutrition: '${model.nutrition}',
                            ),
                            SizedBox(height: getProportionateScreenWidth(8)),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                              decoration: BoxDecoration(
                                color: Constants.kMainBackgroundColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: getProportionateScreenWidth(8)),
                                  Text('Информация о покупателе',
                                      textAlign: TextAlign.start, style: TextStyle(fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.w500)),
                                  SizedBox(height: getProportionateScreenWidth(16)),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                                    decoration: BoxDecoration(color: Constants.kSecondaryBackgroundColor, borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Номер телефона',
                                              textAlign: TextAlign.start, style: TextStyle(fontSize: getProportionateScreenWidth(12), color: Constants.kHintTextColor)),
                                          TextFormField(
                                            maxLines: 1,
                                            scrollPadding: EdgeInsets.zero,
                                            keyboardType: TextInputType.number,
                                            maxLength: 10,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.zero,
                                              prefix: Text('+7'),
                                              counterText: '',
                                            ),
                                            controller: _myTextController,
                                            onChanged: (value) {
                                              enterPhoneNumber(value);
                                              setState(() {});
                                            },
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenWidth(8)),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                                    decoration: BoxDecoration(
                                      color: (!EmailValidator.validate(_myEmailController.text) && _myEmailController.text.isNotEmpty)
                                          ? Constants.kErrorInputColor
                                          : Constants.kSecondaryBackgroundColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Почта', textAlign: TextAlign.start, style: TextStyle(fontSize: getProportionateScreenWidth(12), color: Constants.kHintTextColor)),
                                          Form(
                                            key: formKey,
                                            child: TextFormField(
                                              maxLines: 1,
                                              scrollPadding: EdgeInsets.zero,
                                              keyboardType: TextInputType.emailAddress,
                                              controller: _myEmailController,
                                              autofillHints: const [AutofillHints.email],
                                              validator: (email) => email != null && !EmailValidator.validate(email) ? null : null,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.zero,
                                                counterText: '',
                                              ),
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenWidth(8)),
                                  const Text(
                                    'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту',
                                    style: TextStyle(color: Constants.kSecondaryFontColor),
                                  ),
                                  SizedBox(height: getProportionateScreenWidth(16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(8)),
            ],
          ),
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, child) => ref.watch(touristCardProvider).maybeWhen(
                orElse: () => const SizedBox(),
                done: (listData) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: getProportionateScreenWidth(8)),
                        child: TouristCard(index: index),
                      );
                    },
                    childCount: listData.length,
                  ),
                ),
              ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: getProportionateScreenWidth(8)),
            child: MaterialButton(
              onPressed: () {
                ref.read(touristCardProvider.notifier).addNewTouristCard();
              },
              elevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(12.0)),
              color: Constants.kMainBackgroundColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Добавить туриста', style: TextStyle(fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.w500)),
                    Container(
                      height: getProportionateScreenWidth(32),
                      width: getProportionateScreenWidth(32),
                      decoration: BoxDecoration(color: Constants.kMainButtonsColor, borderRadius: BorderRadius.circular(6)),
                      child: const Icon(
                        Icons.add,
                        color: Constants.kMainBackgroundColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: getProportionateScreenWidth(8)),
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, child) => ref.watch(bookingScreenProvider).maybeWhen(
                    orElse: () => const SizedBox(),
                    done: (model) => Container(
                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8), horizontal: getProportionateScreenWidth(16)),
                      decoration: BoxDecoration(
                        color: Constants.kMainBackgroundColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Тур', style: TextStyle(color: Constants.kSecondaryFontColor, fontSize: getProportionateScreenWidth(16))),
                              Text('${currencyFormat.format(model.tourPrice)} ₽', style: TextStyle(color: Constants.kMainFontColor, fontSize: getProportionateScreenWidth(16))),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenWidth(16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Топливный сбор', style: TextStyle(color: Constants.kSecondaryFontColor, fontSize: getProportionateScreenWidth(16))),
                              Text('${currencyFormat.format(model.fuelCharge)} ₽', style: TextStyle(color: Constants.kMainFontColor, fontSize: getProportionateScreenWidth(16))),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenWidth(16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Сервисный сбор', style: TextStyle(color: Constants.kSecondaryFontColor, fontSize: getProportionateScreenWidth(16))),
                              Text('${currencyFormat.format(model.serviceCharge)} ₽', style: TextStyle(color: Constants.kMainFontColor, fontSize: getProportionateScreenWidth(16))),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenWidth(16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('К оплате', style: TextStyle(color: Constants.kSecondaryFontColor, fontSize: getProportionateScreenWidth(16))),
                              Text('${currencyFormat.format(model.tourPrice! + model.fuelCharge!.toInt() + model.serviceCharge!.toInt())} ₽',
                                  style: TextStyle(color: Constants.kMainButtonsColor, fontSize: getProportionateScreenWidth(16))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, child) => ref.watch(bookingScreenProvider).maybeWhen(
                  orElse: () => const SizedBox(),
                  done: (model) => ScreenFooter(
                    buttonTitle: 'Оплатить ${currencyFormat.format(model.serviceCharge!.toInt() + model.fuelCharge!.toInt() + model.tourPrice!.toInt())} ₽',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const PaidScreen(
                            title: 'Заказ оплачен',
                          ),
                        ),
                      );
                    },
                  ),
                ),
          ),
        )
      ]),
    );
  }

  void enterPhoneNumber(String number) {
    number = number.replaceAll('*', '');
    number = number.replaceAll('-', '');
    number = number.replaceAll('(', '');
    number = number.replaceAll(')', '');
    // print(number);
    if (number.length > 10) {
      debugPrint('Слишком много символов');
      return;
    }
    var myNumber = StringBuffer('');
    for (int i = 0; i < number.length; i++) {
      if (i == 0) {
        myNumber.write('(${number[i]}');
      } else if (i == 2) {
        myNumber.write('${number[i]})');
      } else if (i == 6) {
        myNumber.write('-${number[i]}');
      } else if (i == 8) {
        myNumber.write('-${number[i]}');
      } else {
        myNumber.write(number[i]);
      }
    }
    if (number.length < 10) {
      for (int i = number.length; i < 10; i++) {
        if (i == 0) {
          myNumber.write('(*');
        } else if (i == 2) {
          myNumber.write('*)');
        } else if (i == 6) {
          myNumber.write('-*');
        } else if (i == 8) {
          myNumber.write('-*');
        } else {
          myNumber.write('*');
        }
      }
    }
    var cursorPosition = number.length;
    if (number.length > 8) {
      cursorPosition = cursorPosition + 4;
    } else if (number.length > 6) {
      cursorPosition = cursorPosition + 3;
    } else if (number.length > 3) {
      cursorPosition = cursorPosition + 2;
    } else if (number.length > 0) {
      cursorPosition = cursorPosition + 1;
    }

    print(myNumber);

    _myTextController.text = myNumber.toString();
    _myTextController.selection = TextSelection.fromPosition(TextPosition(offset: cursorPosition));
  }

  void addNewTourist(Tourist tourist) {}
}
