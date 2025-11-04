// repositry pattern
import 'package:booklyapp/core/errors/Failure.dart';
import 'package:booklyapp/core/model/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BooksModel>>> fetchNewstBooks();
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BooksModel>>> fetchSimilerBooks({
    required String CateGory,
  });
  Future<Either<Failure, List<BooksModel>>> fetchSerachBooks();

  Future<Either<Failure, List<BooksModel>>> fetchSerachBooksByCategory(
    String category,
  );
}
