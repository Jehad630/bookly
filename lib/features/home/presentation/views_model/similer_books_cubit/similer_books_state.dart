part of 'similer_books_cubit.dart';

sealed class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

final class SimilerBooksInitial extends SimilerBooksState {}

final class SimilerBooksLoading extends SimilerBooksState {}

final class SimilerBooksSuccess extends SimilerBooksState {
  final List<BooksModel> books;
  const SimilerBooksSuccess(this.books);
}

final class SimilerBooksFaliure extends SimilerBooksState {
  final String errmesg;
  const SimilerBooksFaliure(this.errmesg);
}
