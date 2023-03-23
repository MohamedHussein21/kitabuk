import 'package:dartz/dartz.dart';
import 'package:mybook/features/home/data/models/book_model/book_model.dart';

import '../../../../core/error/falier.dart';

abstract class BaseHomeRepo {
  Future<Either<Falier, List<BookModel>>> getNewestBook();

  Future<Either<Falier, List<BookModel>>> getComputerScienceBook();

  Future<Either<Falier, List<BookModel>>> getProgrammingBook();
}
