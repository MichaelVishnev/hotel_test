import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_for_job/repository/rooms_repository.dart';
import 'hotel_rooms_screen_state.dart';

class HotelRoomsScreenNotifier extends StateNotifier<HotelRoomsScreenState> {
  HotelRoomsScreenNotifier() : super(const HotelRoomsScreenState.initial()) {
    getRoomsScreenData();
  }

  Future<void> getRoomsScreenData() async {
    state = const HotelRoomsScreenState.loading();
    // await Future.delayed(const Duration(seconds: 2));
    final failureOrSuccess = await RoomsRepository().getRoomsData();
    if (failureOrSuccess != null) {
      state = HotelRoomsScreenState.done(model: failureOrSuccess);
    } else if (failureOrSuccess == null) {
      state = const HotelRoomsScreenState.error();
    }
  }
}
