import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_for_job/helpers/constants.dart';
import 'package:test_task_for_job/helpers/size_config.dart';
import 'package:test_task_for_job/models/tourist/tourist.dart';
import 'package:test_task_for_job/riverpod/tourist_card_provider/tourist_card_provider.dart';
import 'package:test_task_for_job/riverpod/tourist_card_provider/tourist_card_state.dart';

class TouristCard extends ConsumerStatefulWidget {
  const TouristCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  ConsumerState<TouristCard> createState() => _TouristCardState();
}

class _TouristCardState extends ConsumerState<TouristCard> {
  String touristName = '';
  String surname = '';
  String birthDate = '';
  String citizenship = '';
  String internationalPassportNumber = '';
  String internationalPassportExpireDate = '';

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      borderOnForeground: true,
      shadowColor: Colors.transparent,
      margin: EdgeInsets.zero,
      surfaceTintColor: Colors.transparent,
      semanticContainer: false,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.white,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          collapsedBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text(
            '${ref.read(touristCardProvider.notifier).getTouristNumber(widget.index)} турист',
            style: TextStyle(fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.w500, color: Constants.kMainFontColor),
          ),
          onExpansionChanged: (bool expanding) {
            _expanded = expanding;
            setState(() {});
          },
          trailing: Container(
            height: getProportionateScreenWidth(32),
            width: getProportionateScreenWidth(32),
            decoration: BoxDecoration(color: Constants.kSecondaryButtonsColor, borderRadius: BorderRadius.circular(6)),
            child: _expanded == true
                ? const Icon(
                    Icons.keyboard_arrow_up,
                    color: Constants.kMainButtonsColor,
                  )
                : const Icon(
                    Icons.keyboard_arrow_down,
                    color: Constants.kMainButtonsColor,
                  ),
          ),
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
              decoration: BoxDecoration(color: Constants.kSecondaryBackgroundColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
                child: TextFormField(
                  initialValue: ref.watch(touristCardProvider).getData()?[widget.index].touristName ?? '',
                  maxLines: 1,
                  scrollPadding: EdgeInsets.zero,
                  decoration: const InputDecoration(
                      border: InputBorder.none, floatingLabelBehavior: FloatingLabelBehavior.auto, labelText: 'Имя', labelStyle: TextStyle(color: Constants.kSecondaryFontColor)),
                  onChanged: (value) {
                    touristName = value;
                    save();
                  },
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(8)),
            Container(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
              decoration: BoxDecoration(color: Constants.kSecondaryBackgroundColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
                child: TextFormField(
                  maxLines: 1,
                  initialValue: ref.watch(touristCardProvider).getData()?[widget.index].surname ?? '',
                  scrollPadding: EdgeInsets.zero,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Фамилия',
                      labelStyle: TextStyle(color: Constants.kSecondaryFontColor)),
                  onChanged: (value) {
                    surname = value;
                    save();
                  },
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(8)),
            Container(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
              decoration: BoxDecoration(color: Constants.kSecondaryBackgroundColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
                child: TextFormField(
                  maxLines: 1,
                  initialValue: ref.watch(touristCardProvider).getData()?[widget.index].birtDate,
                  scrollPadding: EdgeInsets.zero,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Дата рождения',
                      labelStyle: TextStyle(color: Constants.kSecondaryFontColor)),
                  onChanged: (value) {
                    birthDate = value;
                    save();
                  },
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(8)),
            Container(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
              decoration: BoxDecoration(color: Constants.kSecondaryBackgroundColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
                child: TextFormField(
                  maxLines: 1,
                  initialValue: ref.watch(touristCardProvider).getData()?[widget.index].citizenship,
                  scrollPadding: EdgeInsets.zero,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Гражданство',
                      labelStyle: TextStyle(color: Constants.kSecondaryFontColor)),
                  onChanged: (value) {
                    citizenship = value;
                    save();
                  },
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(8)),
            Container(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
              decoration: BoxDecoration(color: Constants.kSecondaryBackgroundColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
                child: TextFormField(
                  maxLines: 1,
                  initialValue: ref.watch(touristCardProvider).getData()?[widget.index].internationalPassportNumber,
                  scrollPadding: EdgeInsets.zero,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Номер загранпаспорта',
                      labelStyle: TextStyle(color: Constants.kSecondaryFontColor)),
                  onChanged: (value) {
                    internationalPassportNumber = value;
                    save();
                  },
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(8)),
            Container(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
              decoration: BoxDecoration(color: Constants.kSecondaryBackgroundColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
                child: TextFormField(
                  maxLines: 1,
                  initialValue: ref.watch(touristCardProvider).getData()?[widget.index].internationalPassportExpireDate,
                  scrollPadding: EdgeInsets.zero,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Срок действия загранпаспорта',
                      labelStyle: TextStyle(color: Constants.kSecondaryFontColor)),
                  onChanged: (value) {
                    internationalPassportExpireDate = value;
                    save();
                  },
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(16)),
          ],
        ),
      ),
    );
  }

  void save() {
    final tourist = Tourist(
      touristName: touristName,
      surname: surname,
      birtDate: birthDate,
      citizenship: citizenship,
      internationalPassportNumber: internationalPassportNumber,
      internationalPassportExpireDate: internationalPassportExpireDate,
    );
    ref.read(touristCardProvider.notifier).addTourist(tourist, widget.index);
  }
}
