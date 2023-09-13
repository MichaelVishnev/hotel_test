import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/hotel/hotel_model.dart';

class HotelRepository {
  Future<HotelModel?> getHotelData() async {
    try {
      var response = await Dio().get('https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3');
      if (response.statusCode == 200) {
        final data = response.data;
        var hotelData = HotelModel.fromJson(data);
        return hotelData;
      }
    } catch (error) {
      debugPrint('Hotel Repository: "Произошла ошибка": $error');
    }
    return null;
  }
}
