import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'booking_screen_notifier.dart';
import 'booking_screen_state.dart';

final bookingScreenProvider = StateNotifierProvider<BookingScreenNotifier, BookingScreenState>((ref) => BookingScreenNotifier());
