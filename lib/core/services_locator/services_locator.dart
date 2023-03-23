import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mybook/core/utils/api_server.dart';
import 'package:mybook/features/home/data/repo/repo_implemantion.dart';

GetIt getIt = GetIt.instance;

void setupSL() {
  getIt.registerSingleton<ApiServer>(ApiServer(Dio()));

  getIt.registerSingleton<RepoHomeImplementation>(
      RepoHomeImplementation(getIt.get<ApiServer>()));
}
