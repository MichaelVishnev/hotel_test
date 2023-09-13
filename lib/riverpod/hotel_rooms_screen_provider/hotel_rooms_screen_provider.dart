import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hotel_rooms_screen_notifier.dart';
import 'hotel_rooms_screen_state.dart';


final hotelRoomsScreenProvider = StateNotifierProvider<HotelRoomsScreenNotifier, HotelRoomsScreenState>((ref) => HotelRoomsScreenNotifier());
