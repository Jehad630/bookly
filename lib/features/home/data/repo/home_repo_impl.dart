import 'package:booklyapp/core/errors/Failure.dart';
import 'package:booklyapp/features/home/data/models/books_model/books_model.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo{
  
  @override
  Future<Either<Failure, List<BooksModel>>> fetchBestSellerBooks() {
    // TODO: implement fetchBestSellerBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}