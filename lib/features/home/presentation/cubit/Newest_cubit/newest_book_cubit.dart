import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mybook/features/home/data/models/book_model/book_model.dart';
import 'package:mybook/features/home/data/repo/home_repositry.dart';

part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookInitial());

  final BaseHomeRepo homeRepo;

  Future<void> getNewestBooks() async {
    emit(LoadingNewestBookStates());
    var result = await homeRepo.getNewestBook();

    result.fold((faliar) {
      emit(ErrorNewestBookStates(faliar.toString()));
    }, (books) {
      emit(SucsessNewestBookStates(books));
    });
  }
}
