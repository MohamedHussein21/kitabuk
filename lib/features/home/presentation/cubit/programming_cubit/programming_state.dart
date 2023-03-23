part of 'programming_cubit.dart';

abstract class ProgrammingState extends Equatable {
  const ProgrammingState();

  @override
  List<Object> get props => [];
}

class ProgrammingInitial extends ProgrammingState {}

class LoadingProgrmamingBookStates extends ProgrammingState {}

class SucsessProgrmamingBookStates extends ProgrammingState {
  final List<BookModel> books;

  const SucsessProgrmamingBookStates(this.books);
}

class ErrorProgrmamingBookStates extends ProgrammingState {
  final String errorMassage;

  const ErrorProgrmamingBookStates(this.errorMassage);
}
