import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

import 'package:booklyapp/core/errors/Failure.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/features/home/data/models/books_model/books_model.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BooksModel>>> fetchNewstBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            "/volumes?q=subject:Programming&sorting=newest&Filetring=free-ebooks",
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
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            "/volumes?q=subject:Programming&Filetring=free-ebooks",
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
