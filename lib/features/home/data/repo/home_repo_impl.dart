import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

import 'package:booklyapp/core/errors/Failure.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/features/home/data/models/books_model/books_model.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

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
        books.add(
          BooksModel.fromjson(
            item,
          ),
        );
      }
      return right(books);
    } on Exception catch (e) {
      return left(serverFaliure());
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
