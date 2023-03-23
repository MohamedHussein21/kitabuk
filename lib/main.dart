import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/config/routes/routes.dart';
import 'package:mybook/core/services_locator/services_locator.dart';
import 'package:mybook/features/home/data/repo/repo_implemantion.dart';
import 'package:mybook/features/home/presentation/cubit/Newest_cubit/newest_book_cubit.dart';

import 'features/home/presentation/cubit/cmputer_science_book_cubit/computer_books_cubit.dart';
import 'features/home/presentation/cubit/programming_cubit/programming_cubit.dart';

void main() {
  setupSL();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                NewestBookCubit(getIt.get<RepoHomeImplementation>())
                  ..getNewestBooks()),
        BlocProvider(
            create: (context) =>
                ComputerScienceBooksCubit(getIt.get<RepoHomeImplementation>())
                  ..getComputerSceinceBooks()),
        BlocProvider(
            create: (context) =>
                ProgrammingBookCubit(getIt.get<RepoHomeImplementation>())
                  ..getProgrammingBooks()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Book ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
