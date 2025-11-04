part of 'serach_books_cubit.dart';

sealed class SerachBooksState extends Equatable {
  const SerachBooksState();

  @override
  List<Object> get props => [];
}

final class SerachBooksInitial extends SerachBooksState {}

final class SerachBookSuccess extends SerachBooksState {
  final List<BooksModel> books;
  const SerachBookSuccess(this.books);
}

final class SerachBooksFailiure extends SerachBooksState {
  final String errmesg;

  const SerachBooksFailiure(this.errmesg);
}

final class SerachBooksLoading extends SerachBooksState {}
