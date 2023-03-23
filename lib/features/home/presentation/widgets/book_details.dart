import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/mediaQuary.dart';
import 'package:mybook/features/home/data/models/book_model/book_model.dart';
import 'package:mybook/features/home/presentation/pages/book_details.dart';

import '../../../auth/widgets/default_button.dart';

class BookDetails extends StatelessWidget {
  final BookModel bookModel;

  const BookDetails({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail!,
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
        SizedBox(
          width: context.width * 0.02,
        ),
        SizedBox(
          width: context.width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.heigh * 0.01,
              ),
              Text(
                bookModel.volumeInfo.title,
                style: TextStyle(
                  color: AppColor.titleColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: context.heigh * 0.01,
              ),
              Text(
                'by : ${bookModel.volumeInfo.authors}',
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: context.heigh * 0.01,
              ),
              Text('${bookModel.volumeInfo.pageCount} pages'),
              SizedBox(
                height: context.heigh * 0.01,
              ),
              Row(
                children: [
                  Text('${bookModel.volumeInfo.averageRating}'),
                  SizedBox(
                    width: context.width * 0.01,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColor.defaultColor,
                  )
                ],
              ),
              SizedBox(
                height: context.heigh * 0.01,
              ),
              DefaultButton(
                submit: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BookInfo(bookModel: bookModel)));
                },
                title: 'read',
                width: 100,
              )
            ],
          ),
        )
      ],
    );
  }
}
