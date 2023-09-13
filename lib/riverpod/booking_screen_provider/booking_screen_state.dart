import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_for_job/models/booking_model/booking_model.dart';
part 'booking_screen_state.freezed.dart';


extension BookingScreenStateGetters on BookingScreenState {
  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isDone => this is _Done;
  bool get isError => this is _Error;
}

@freezed
class BookingScreenState with _$BookingScreenState {
  const factory BookingScreenState.initial() = _Initial;

  const factory BookingScreenState.loading() = _Loading;

  const factory BookingScreenState.done({required BookingModel model}) = _Done;

  const factory BookingScreenState.error() = _Error;
}