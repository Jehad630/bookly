import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/model/books_model/books_model.dart';
import 'package:booklyapp/core/repo/home_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'serach_books_state.dart';

class SerachBooksCubit extends Cubit<SerachBooksState> {
  final HomeRepoImpl homeRepo;

  SerachBooksCubit(this.homeRepo) : super(SerachBooksInitial());

  Future<void> fetchSearchBooks(String category) async {
    emit(SerachBooksLoading());
    final result = await homeRepo.fetchSerachBooksByCategory(category);
    result.fold(
      (failure) => emit(SerachBooksFailiure(failure.errmesg)),
      (books) => emit(SerachBookSuccess(books)),
    );
  }
}
