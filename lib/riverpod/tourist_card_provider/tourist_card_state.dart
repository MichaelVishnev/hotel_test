import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_for_job/models/tourist/tourist.dart';
part 'tourist_card_state.freezed.dart';

extension TouristCardStateGetters on TouristCardState {
  bool get isInitial => this is _Initial;
  bool get isDone => this is _Done;
  bool get isError => this is _Error;

  List<Tourist>? getData() => maybeWhen(
        done: (touristModel) {
          return touristModel;
        },
        orElse: () => null
      );
}

@freezed
class TouristCardState with _$TouristCardState {
  const factory TouristCardState.initial() = _Initial;

  const factory TouristCardState.done({required List<Tourist> touristModel}) = _Done;

  const factory TouristCardState.error() = _Error;
}
