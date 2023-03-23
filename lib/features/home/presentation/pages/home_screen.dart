import 'package:flutter/material.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/mediaQuary.dart';

import '../widgets/newest_books_list_view.dart';
import '../widgets/programming_list_veiw.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello Welcome back!!',
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    ' It\'s time to read !',
                    style: TextStyle(fontSize: 15, color: AppColor.grayColor),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: context.heigh * 0.02,
          ),
          const Text(
            ' Newest Books',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: context.heigh * 0.02,
          ),
          const NewestBooksListView(),
          const Text(
            ' Programming Books',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: context.heigh * 0.02,
          ),
          const ProgrammingBooksListView()
        ]),
      ),
    );
  }
}
