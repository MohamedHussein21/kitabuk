import 'package:dio/dio.dart';
import 'package:mybook/core/utils/api_server.dart';
import 'package:mybook/features/home/data/models/book_model/book_model.dart';
import 'package:mybook/core/error/falier.dart';
import 'package:dartz/dartz.dart';
import 'package:mybook/features/home/data/repo/home_repositry.dart';

class RepoHomeImplementation implements BaseHomeRepo {
  final ApiServer apiServer;

  RepoHomeImplementation(this.apiServer);
  @override
  Future<Either<Falier, List<BookModel>>> getNewestBook() async {
    try {
      var data = await apiServer.get(
          endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=all');

      List<BookModel> books = [];
      for (var items in data['items']) {
        books.add(BookModel.fromJson(items));
      }

      return right(books);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFalier.fromDioError(error));
      }
      return left(ServerFalier(error.toString()));
    }
  }

  @override
  Future<Either<Falier, List<BookModel>>> getComputerScienceBook() async {
    try {
      var data = await apiServer.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=computer sceince');

      List<BookModel> books = [];
      for (var items in data['items']) {
        books.add(BookModel.fromJson(items));
      }

      return right(books);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFalier.fromDioError(error));
      }
      return left(ServerFalier(error.toString()));
    }
  }

  @override
  Future<Either<Falier, List<BookModel>>> getProgrammingBook() async {
    try {
      var data = await apiServer.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=programming');

      List<BookModel> books = [];
      for (var items in data['items']) {
        books.add(BookModel.fromJson(items));
      }

      return right(books);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFalier.fromDioError(error));
      }
      return left(ServerFalier(error.toString()));
    }
  }
}
