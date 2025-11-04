import 'package:booklyapp/core/errors/Failure.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/core/model/models/books_model/books_model.dart';
import 'package:booklyapp/core/repo/home_repo.dart';
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
        } catch (e) {
          return left(serverFaliure(e.toString()));
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
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(serverFaliure.fromDioError(e));
      }

      return left(serverFaliure(e.toString()));
    }
  }

  // this data for the down list view in the similerview
  @override
  Future<Either<Failure, List<BooksModel>>> fetchSimilerBooks({
    required String CateGory,
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

  //serach view list view
  @override
  Future<Either<Failure, List<BooksModel>>> fetchSerachBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            "https://www.googleapis.com/books/v1/volumes?q=subject:{CATEGORY}&filter=free-ebooks&orderBy=relevance",
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

  @override
  Future<Either<Failure, List<BooksModel>>> fetchSerachBooksByCategory(
    String category,
  ) async {
    try {
      // ملاحظة: ApiService يبني URL كـ "$_baseUrl$endpoint"
      // Base: https://www.googleapis.com/books/v1
      // Endpoint الصحيح (بدون أخطاء إملائية):
      final endpoint = "/volumes?Filtering=free-ebooks&q=subject:$category";

      var data = await apiService.get(endpoint: endpoint);

      List<BooksModel> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BooksModel.fromjson(item));
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
}
