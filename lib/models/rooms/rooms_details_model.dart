import '../about_the_hotel/about_the_hotel.dart';

class RoomsDetailsModel {
  RoomsDetailsModel({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });
  final int? id;
  final String? name;
  final int? price;
  final String? pricePer;
  final List<String>? peculiarities;
  final List<String>? imageUrls;

  factory RoomsDetailsModel.fromJson(Map<String, dynamic> json) {
    List<String> getList(List<dynamic> list) {
      List<String> listData = [];
      for (int i = 0; i < list.length; i++) {
        if (list[i] is String) {
          listData.add(list[i] as String);
        }
      }
      return listData;
    }

    return RoomsDetailsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      pricePer: json['price_per'] as String?,
      peculiarities: getList(json['peculiarities']),
      imageUrls: getList(json['image_urls']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'price_per': pricePer,
      'peculiarities': peculiarities,
      'image_urls': imageUrls,
    };
  }

}
