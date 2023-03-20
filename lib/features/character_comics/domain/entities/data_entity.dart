import 'package:equatable/equatable.dart';

import 'result_entity.dart';

class Data extends Equatable {
  const Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<Result>? results;

  @override
  List<Object?> get props => [offset, limit, total, count, results];
}
