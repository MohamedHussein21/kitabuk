import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repo/home_repositry.dart';

part 'computer_books_state.dart';

class ComputerScienceBooksCubit extends Cubit<FeatureBooksState> {
  ComputerScienceBooksCubit(this.homeRepo) : super(FeatureBooksInitial());

  final BaseHomeRepo homeRepo;

  Future getComputerSceinceBooks() async {
    emit(LoadingFeatureBookStates());
    var result = await homeRepo.getComputerScienceBook();

    result.fold((faliar) {
      emit(ErrorFeatureBookStates(faliar.toString()));
    }, (books) {
      emit(SucsessFeatureBookStates(books));
    });
  }
}
