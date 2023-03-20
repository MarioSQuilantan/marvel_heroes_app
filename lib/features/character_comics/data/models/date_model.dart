import '../../domain/entities/date_entity.dart';

class DateModel extends Date {
  const DateModel({
    required super.type,
    required super.date,
  });

  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
        type: json["type"],
        date: json["date"],
      );

  factory DateModel.fromEntity(Date date) => DateModel(
        type: date.type,
        date: date.date,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "date": date,
      };
}
