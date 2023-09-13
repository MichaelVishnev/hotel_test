import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/hotel/hotel_model.dart';
part 'hotel_screen_state.freezed.dart';


extension HotelScreenStateGetters on HotelScreenState {
  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isDone => this is _Done;
  bool get isError => this is _Error;
}

@freezed
class HotelScreenState with _$HotelScreenState {
  const factory HotelScreenState.initial() = _Initial;

  const factory HotelScreenState.loading() = _Loading;

  const factory HotelScreenState.done({required HotelModel model}) = _Done;

  const factory HotelScreenState.error() = _Error;
}