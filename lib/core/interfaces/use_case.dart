import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class IdParams extends Equatable {
  final int id;

  const IdParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
