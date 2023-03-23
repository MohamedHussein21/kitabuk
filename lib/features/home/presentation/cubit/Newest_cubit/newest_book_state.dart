part of 'newest_book_cubit.dart';

abstract class NewestBookState extends Equatable {
  const NewestBookState();

  @override
  List<Object> get props => [];
}

class NewestBookInitial extends NewestBookState {}

class LoadingNewestBookStates extends NewestBookState {}

class SucsessNewestBookStates extends NewestBookState {
  final List<BookModel> books;

  const SucsessNewestBookStates(this.books);
}

class ErrorNewestBookStates extends NewestBookState {
  final String errorMassage;

  const ErrorNewestBookStates(this.errorMassage);
}
