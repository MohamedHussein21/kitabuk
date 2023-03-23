import 'package:dio/dio.dart';

class ApiServer {
  final _baseUtl = 'https://www.googleapis.com/books/v1/';

  final Dio _dio;

  ApiServer(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var responce = await _dio.get('$_baseUtl$endPoint');
    return responce.data;
  }
}
