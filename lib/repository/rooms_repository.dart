import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/hotel/hotel_model.dart';
import '../models/rooms/rooms_model.dart';

class RoomsRepository {
  Future<RoomsModel?> getRoomsData() async {
    try {
      var response = await Dio().get('https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd');
      if (response.statusCode == 200) {
        final data = response.data;
        // debugPrint('Message Repository: "response.data": $data');
        var roomsData = RoomsModel.fromJson(data);
        return roomsData;
      }
    } catch (error) {
      debugPrint('Rooms Repository: "Произошла ошибка": $error');
    }
    return null;
  }
}
