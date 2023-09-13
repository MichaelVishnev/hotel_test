import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_for_job/models/rooms/rooms_model.dart';
part 'hotel_rooms_screen_state.freezed.dart';


extension HotelRoomsScreenStateGetters on HotelRoomsScreenState {
  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isDone => this is _Done;
  bool get isError => this is _Error;
}

@freezed
class HotelRoomsScreenState with _$HotelRoomsScreenState {
  const factory HotelRoomsScreenState.initial() = _Initial;

  const factory HotelRoomsScreenState.loading() = _Loading;

  const factory HotelRoomsScreenState.done({required RoomsModel model}) = _Done;

  const factory HotelRoomsScreenState.error() = _Error;
}