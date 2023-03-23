import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/utils/mediaQuary.dart';
import 'package:mybook/features/home/presentation/cubit/programming_cubit/programming_cubit.dart';

import 'book_details.dart';

class ProgrammingBooksListView extends StatelessWidget {
  const ProgrammingBooksListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProgrammingBookCubit, ProgrammingState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SucsessProgrmamingBookStates) {
            return Expanded(
              flex: 2,
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => BookDetails(
                        bookModel: state.books[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: context.heigh * 0.01,
                      ),
                  itemCount: state.books.length),
            );
          } else if (state is ErrorProgrmamingBookStates) {
            return Text(state.errorMassage);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
