import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelScreenImagesProvider = StateProvider((ref) => 0);
final hotelRoomsScreenImagesProvider = StateProvider.autoDispose.family((ref,id) => 0);