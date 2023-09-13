import '../about_the_hotel/about_the_hotel.dart';

class HotelModel {
  HotelModel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });
  final int? id;
  final String? name;
  final String? adress;
  final int? minimalPrice;
  final String? priceForIt;
  final int? rating;
  final String? ratingName;
  final List<String> imageUrls;
  final AboutTheHotel? aboutTheHotel;

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    List<String> getList(List<dynamic> list) {
      List<String> imagesList = [];
      for (int i = 0; i < list.length; i++) {
        if (list[i] is String) {
          imagesList.add(list[i] as String);
        }
      }
      return imagesList;
    }

    return HotelModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      adress: json['adress'] as String?,
      minimalPrice: json['minimal_price'] as int?,
      priceForIt: json['price_for_it'] as String?,
      rating: json['rating'] as int?,
      ratingName: json['rating_name'] as String?,
      imageUrls: getList(json['image_urls']),
      aboutTheHotel: AboutTheHotel.fromJson(json['about_the_hotel']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'adress': adress,
      'minimal_price': minimalPrice,
      'price_for_it': priceForIt,
      'rating': rating,
      'rating_name': ratingName,
      'image_urls': imageUrls,
      'about_the_hotel': aboutTheHotel,
    };
  }
}
