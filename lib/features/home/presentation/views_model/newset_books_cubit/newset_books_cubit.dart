import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/model/books_model/books_model.dart';
import 'package:booklyapp/core/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewstBooks();

    result.fold(
      (faliure) {
        emit(NewsetBooksFaliure(faliure.errmesg));
      },
      (books) {
        emit(NewsetBooksSuccess(books));
      },
    );
  }
}
