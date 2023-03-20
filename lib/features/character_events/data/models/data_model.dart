import '../../domain/entities/data_entity.dart';
import 'result_model.dart';

class DataModel extends Data {
  const DataModel({
    required super.offset,
    required super.limit,
    required super.total,
    required super.count,
    required super.results,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: json["results"] == null ? [] : List<ResultModel>.from(json["results"].map((x) => ResultModel.fromJson(x))),
      );

  factory DataModel.fromEntity(Data data) => DataModel(
        offset: data.offset,
        limit: data.limit,
        total: data.total,
        count: data.count,
        results: data.results,
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": results == null ? [] : results!.map((e) => ResultModel.fromEntity(e).toJson()).toList(),
      };
}
