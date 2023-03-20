import 'package:equatable/equatable.dart';

class Price extends Equatable {
  const Price({
    this.type,
    this.price,
  });

  final String? type;
  final num? price;

  @override
  List<Object?> get props => [type, price];
}
