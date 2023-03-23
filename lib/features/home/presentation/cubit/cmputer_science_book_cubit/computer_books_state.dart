part of 'computer_books_cubit.dart';

abstract class FeatureBooksState extends Equatable {
  const FeatureBooksState();

  @override
  List<Object> get props => [];
}

class FeatureBooksInitial extends FeatureBooksState {}

class LoadingFeatureBookStates extends FeatureBooksState {}

class SucsessFeatureBookStates extends FeatureBooksState {
  final List<BookModel> books;

  const SucsessFeatureBookStates(this.books);
}

class ErrorFeatureBookStates extends FeatureBooksState {
  final String errorMassage;

  const ErrorFeatureBookStates(this.errorMassage);
}
