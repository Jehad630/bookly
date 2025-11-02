// repositry pattern
import 'package:booklyapp/core/errors/Failure.dart';
import 'package:booklyapp/features/home/data/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BooksModel>>> fetchNewstBooks();
  Future<Either<Failure,List<BooksModel>>>  fetchFeaturedBooks();
}
