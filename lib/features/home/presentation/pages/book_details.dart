import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import '../widgets/book_Info_widget.dart';

class BookInfo extends StatelessWidget {
  final BookModel bookModel;

  const BookInfo({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: BookInfoWidget(
            bookModel: bookModel,
          ),
        )
      ],
    ));
  }
}
