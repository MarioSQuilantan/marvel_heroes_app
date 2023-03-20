import '../../domain/entities/price_entity.dart';

class PriceModel extends Price {
  const PriceModel({
    required super.type,
    required super.price,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        type: json["type"],
        price: json["price"],
      );

  factory PriceModel.fromEntity(Price price) => PriceModel(
        type: price.type,
        price: price.price,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
      };
}
