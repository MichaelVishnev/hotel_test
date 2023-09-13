import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_for_job/riverpod/tourist_card_provider/tourist_card_notifier.dart';
import 'package:test_task_for_job/riverpod/tourist_card_provider/tourist_card_state.dart';


final touristCardProvider = StateNotifierProvider<TouristCardNotifier, TouristCardState>((ref) => TouristCardNotifier());
