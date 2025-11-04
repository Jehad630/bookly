part of 'newset_books_cubit.dart';

sealed class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  List<Object> get props => [];
}

final class NewsetBooksInitial extends NewsetBooksState {}
final class NewsetBooksLoading extends NewsetBooksState {}
final class NewsetBooksSuccess extends NewsetBooksState {
  final List<BooksModel> books;
  const NewsetBooksSuccess(this.books);
}
final class NewsetBooksFaliure extends NewsetBooksState {
  final String errmesg;
const  NewsetBooksFaliure(this.errmesg);
}
