import 'package:flutter/material.dart';
import 'package:mybook/core/utils/mediaQuary.dart';
import 'package:mybook/features/auth/widgets/default_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/colors.dart';
import '../../data/models/book_model/book_model.dart';

class BookInfoWidget extends StatelessWidget {
  final BookModel bookModel;

  const BookInfoWidget({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.heigh,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      NetworkImage(bookModel.volumeInfo.imageLinks!.thumbnail!),
                  fit: BoxFit.fill,
                  opacity: 0.5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.save_alt)),
                    ],
                  ),
                  SizedBox(
                    height: context.heigh * 0.05,
                  ),
                  Image.network(bookModel.volumeInfo.imageLinks!.thumbnail!),
                  SizedBox(
                    height: context.heigh * 0.05,
                  ),
                  Text(
                    bookModel.volumeInfo.title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: context.heigh * 0.01,
                  ),
                  Text(
                    'by : ${bookModel.volumeInfo.authors}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: context.heigh * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.book),
                          Text(
                            '${bookModel.volumeInfo.pageCount} pages',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: AppColor.defaultColor,
                          ),
                          Text(
                            '${bookModel.volumeInfo.averageRating}',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.heigh * 0.02,
                  ),
                  DefaultButton(
                      submit: () async {
                        final Uri url =
                            Uri.parse(bookModel.volumeInfo.previewLink!);
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      title: 'read',
                      width: context.width * 0.3),
                  SizedBox(
                    height: context.heigh * 0.05,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: context.heigh * 0.03,
                  ),
                  Text(
                    '${bookModel.volumeInfo.description}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
