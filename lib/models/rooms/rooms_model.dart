import 'package:test_task_for_job/models/rooms/rooms_details_model.dart';

import '../about_the_hotel/about_the_hotel.dart';

class RoomsModel {
  RoomsModel({
    required this.rooms,
  });
  final List<RoomsDetailsModel>? rooms;

  Map<String, dynamic> toJson() {
    return {
      'rooms': rooms,
    };
  }

  factory RoomsModel.fromJson(Map<String, dynamic> json) {

    List<RoomsDetailsModel> getList(List<dynamic> list) {
      List<RoomsDetailsModel> roomsDetailsList = [];
      for (int i = 0; i < list.length; i++) {
       var item = RoomsDetailsModel.fromJson(list[i]);
       roomsDetailsList.add(item);

      }
      return roomsDetailsList;
    }

    return RoomsModel(
      rooms:getList(json['rooms']),
      //   rooms: RoomsDetailsModel.fromJson(json['rooms']),
    );
  }
}
