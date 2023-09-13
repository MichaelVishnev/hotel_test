import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_task_for_job/models/booking_model/booking_model.dart';

class BookingRepository {
  Future<BookingModel?> getBookingData() async {
    try {
      var response = await Dio().get('https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8');
      if (response.statusCode == 200) {
        final data = response.data;
        var bookingData = BookingModel.fromJson(data);
        return bookingData;
      }
    } catch (error) {
      debugPrint('Booking Repository: "Произошла ошибка": $error');
    }
    return null;
  }
}
