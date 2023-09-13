
class BookingModel {
  BookingModel({
    required this.id,
    required this.hotelName,
    required this.hotelAdress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });
  final int? id;
  final String? hotelName;
  final String? hotelAdress;
  final int? horating;
  final String? ratingName;
  final String? departure;
  final String? arrivalCountry;
  final String? tourDateStart;
  final String? tourDateStop;
  final int? numberOfNights;
  final String? room;
  final String? nutrition;
  final int? tourPrice;
  final int? fuelCharge;
  final int? serviceCharge;

  factory BookingModel.fromJson(Map<String, dynamic> json) {

    return BookingModel(
      id: json['id'] as int?,
      hotelName: json['hotel_name'] as String?,
      hotelAdress: json['hotel_adress'] as String?,
      horating: json['horating'] as int?,
      ratingName: json['rating_name'] as String?,
      departure: json['departure'] as String?,
      arrivalCountry: json['arrival_country'] as String?,
      tourDateStart: json['tour_date_start'] as String?,
      tourDateStop: json['tour_date_stop'] as String?,
      numberOfNights: json['number_of_nights'] as int?,
      room: json['room'] as String?,
      nutrition: json['nutrition'] as String?,
      tourPrice: json['tour_price'] as int?,
      fuelCharge: json['fuel_charge'] as int?,
      serviceCharge: json['service_charge'] as int?,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotel_name': hotelName,
      'hotel_adress': hotelAdress,
      'horating': horating,
      'rating_name': ratingName,
      'departure': departure,
      'arrival_country': arrivalCountry,
      'tour_date_start': tourDateStart,
      'tour_date_stop': tourDateStop,
      'number_of_nights': numberOfNights,
      'room': room,
      'nutrition': nutrition,
      'tour_price': tourPrice,
      'fuel_charge': fuelCharge,
      'service_charge': serviceCharge,
    };
  }
}
