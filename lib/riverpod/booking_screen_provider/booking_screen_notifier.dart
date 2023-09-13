import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_for_job/repository/booking_repository.dart';
import 'booking_screen_state.dart';

class BookingScreenNotifier extends StateNotifier<BookingScreenState> {
  BookingScreenNotifier() : super(const BookingScreenState.initial()) {
    getBookingScreenData();
  }

  Future<void> getBookingScreenData() async {
    state = const BookingScreenState.loading();
    await Future.delayed(const Duration(seconds: 2));
    final failureOrSuccess = await BookingRepository().getBookingData();
    if (failureOrSuccess != null) {
      state = BookingScreenState.done(model: failureOrSuccess);
    } else if (failureOrSuccess == null) {
      state = const BookingScreenState.error();
    }
  }
}
