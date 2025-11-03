import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/models/books_model/books_model.dart';
import 'package:booklyapp/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.homeRepo) : super(SimilerBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilerBooks({required String category}) async {
    emit(SimilerBooksLoading());
    var result = await homeRepo.fetchSimilerBooks(category: category);

    result.fold(
      (faliure) {
        emit(SimilerBooksFaliure(faliure.errmesg));
      },
      (books) {
        emit(SimilerBooksSuccess(books));
      },
    );
  }
}
