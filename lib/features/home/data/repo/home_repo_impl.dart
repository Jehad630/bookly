import 'package:booklyapp/core/errors/Failure.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/features/home/data/models/books_model/books_model.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:booklyapp/features/home/presentation/views_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  // this data for the down list view (Newset Books)
  @override
  Future<Either<Failure, List<BooksModel>>> fetchNewstBooks() async {
    try {
      var data = await apiService.get(
        endpoint: "/volumes?q=subject:computer science&Filetring=free-ebooks",
      );
      List<BooksModel> books = [];
      for (var item in data["items"]) {
        try {
          books.add(BooksModel.fromjson(item));
        } on Exception catch (e) {
          
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(serverFaliure.fromDioError(e));
      }

      return left(serverFaliure(e.toString()));
    }
  }

  // this data for the up list view
  @override
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endpoint: "/volumes?Filtering=free-ebooks&q=subject:Programming",
      );
      List<BooksModel> books = [];
      for (var item in data["items"]) {
        books.add(BooksModel.fromjson(item));
        print(item);
      }
      
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(serverFaliure.fromDioError(e));
        
      }

      return left(serverFaliure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchSimilerBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endpoint:
            "/volumes?Filtering=free-ebooks&q=subject:Computer science&sorting=relevance",
      );
      List<BooksModel> books = [];
      for (var item in data["items"]) {
        books.add(BooksModel.fromjson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(serverFaliure.fromDioError(e));
      }

      return left(serverFaliure(e.toString()));
    }
  }
}
