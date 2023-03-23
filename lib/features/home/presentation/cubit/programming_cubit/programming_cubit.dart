import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repo/home_repositry.dart';

part 'programming_state.dart';

class ProgrammingBookCubit extends Cubit<ProgrammingState> {
  ProgrammingBookCubit(this.homeRepo) : super(ProgrammingInitial());

  final BaseHomeRepo homeRepo;

  Future<void> getProgrammingBooks() async {
    emit(LoadingProgrmamingBookStates());
    var result = await homeRepo.getProgrammingBook();

    result.fold((faliar) {
      emit(ErrorProgrmamingBookStates(faliar.toString()));
    }, (books) {
      emit(SucsessProgrmamingBookStates(books));
    });
  }
}
