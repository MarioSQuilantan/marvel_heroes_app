import '../../domain/entities/next_entity.dart';

class NextModel extends Next {
  const NextModel({
    required super.resourceUri,
    required super.name,
  });

  factory NextModel.fromJson(Map<String, dynamic> json) => NextModel(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  factory NextModel.fromEntity(Next next) => NextModel(
        resourceUri: next.resourceUri,
        name: next.name,
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}
