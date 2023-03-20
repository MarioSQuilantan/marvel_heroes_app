import 'package:equatable/equatable.dart';

class Date extends Equatable {
  const Date({
    this.type,
    this.date,
  });

  final String? type;
  final String? date;

  @override
  List<Object?> get props => [type, date];
}
