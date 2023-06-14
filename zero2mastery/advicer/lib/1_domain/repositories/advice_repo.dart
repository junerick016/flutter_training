import 'package:advicer/1_domain/entities/advice_entiry.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource();
}
