import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hotel_screen_notifier.dart';
import 'hotel_screen_state.dart';

final hotelScreenProvider = StateNotifierProvider<HotelScreenNotifier, HotelScreenState>((ref) => HotelScreenNotifier());
