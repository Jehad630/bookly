import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/repo/home_repo.dart';
import 'package:booklyapp/core/model/models/books_model/books_model.dart';
import 'package:equatable/equatable.dart';

part 'serach_books_state.dart';

class SerachBooksCubit extends Cubit<SerachBooksState> {
  SerachBooksCubit(this.homeRepo) : super(SerachBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSerachBooks() async {
    emit(SerachBooksLoading());
    var result = await homeRepo.fetchSerachBooks();

    result.fold(
      (faliure) {
        emit(SerachBooksFailiure(faliure.errmesg));
      },
      (books) {
        emit(SerachBookSuccess(books));
      },
    );
  }
}
