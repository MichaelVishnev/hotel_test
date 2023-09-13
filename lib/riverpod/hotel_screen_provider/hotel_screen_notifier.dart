import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_for_job/repository/hotel_repository.dart';
import 'hotel_screen_state.dart';

class HotelScreenNotifier extends StateNotifier<HotelScreenState> {
  HotelScreenNotifier() : super(const HotelScreenState.initial()) {
    getHotelScreenData();
  }

  Future<void> getHotelScreenData() async {
    state = const HotelScreenState.loading();
    await Future.delayed(const Duration(seconds: 2));
    final failureOrSuccess = await HotelRepository().getHotelData();
    if (failureOrSuccess != null) {
      state = HotelScreenState.done(model: failureOrSuccess);
    } else if (failureOrSuccess == null) {
      state = const HotelScreenState.error();
    }
  }
}
