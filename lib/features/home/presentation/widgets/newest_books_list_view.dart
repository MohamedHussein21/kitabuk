import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/features/home/presentation/cubit/Newest_cubit/newest_book_cubit.dart';

import 'book_details.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBookCubit, NewestBookState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SucsessNewestBookStates) {
            return Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BookDetails(
                        bookModel: state.books[index],
                      ),
                  itemCount: state.books.length),
            );
          } else if (state is ErrorNewestBookStates) {
            return Text(state.errorMassage);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
