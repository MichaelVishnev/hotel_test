import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_for_job/models/tourist/tourist.dart';
import 'package:test_task_for_job/riverpod/tourist_card_provider/tourist_card_state.dart';

class TouristCardNotifier extends StateNotifier<TouristCardState> {
  TouristCardNotifier() : super(const TouristCardState.initial()) {
    getTouristInitialCardData();
  }

  Future<void> getTouristInitialCardData() async {
    List<Tourist> list = [];
    final touristInitialCard = Tourist(touristName: '', surname: '', birtDate: '', citizenship: '', internationalPassportNumber: '', internationalPassportExpireDate: '');
    list.add(touristInitialCard);
    state = TouristCardState.done(touristModel: list);
  }

  void addNewTouristCard() {
    if (state.getData() != null) {
      List<Tourist> list = [];
      final touristInitialCard = Tourist(
        touristName: '',
        surname: '',
        birtDate: '',
        citizenship: '',
        internationalPassportNumber: '',
        internationalPassportExpireDate: '',
      );
      list.addAll(state.getData()!);
      list.add(touristInitialCard);
      state = TouristCardState.done(touristModel: list);
    }
  }

  void addTourist(Tourist tourist,int index) {
    if (state.getData() != null) {
      List<Tourist> list = [];
      list.addAll(state.getData()!);
      list[index]=tourist;
      state = TouristCardState.done(touristModel: list);
    }
  }

  String getTouristNumber(int index) {
    switch (index) {
      case 0:
        return 'Первый';
      case 1:
        return 'Второй';
      case 2:
        return 'Третий';
      case 3:
        return 'Четвертый';
      case 4:
        return 'Пятый';
      case 5:
        return 'Шестой';
      default:
        return 'Очередной';
    }
  }
}
