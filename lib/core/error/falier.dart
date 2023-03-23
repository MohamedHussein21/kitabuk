import 'package:dio/dio.dart';

abstract class Falier {
  final String errorMassage;

  Falier(this.errorMassage);
}

class ServerFalier extends Falier {
  ServerFalier(String errorMassage) : super(errorMassage);

  factory ServerFalier.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFalier('Connection TimeOut');
      case DioErrorType.sendTimeout:
        return ServerFalier('Sent TimeOut');

      case DioErrorType.receiveTimeout:
        return ServerFalier('recive TimeOut');

      case DioErrorType.badCertificate:
        return ServerFalier('bad Certificate');

      case DioErrorType.badResponse:
        return ServerFalier.responseError(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFalier('cancel');
      case DioErrorType.connectionError:
        return ServerFalier('connectionError');
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFalier('No Internet');
        }

        return ServerFalier('Error ,please try again later');

      default:
        return ServerFalier('Error ,please try again later');
    }
  }

  factory ServerFalier.responseError(int statusCode, dynamic resonse) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFalier(resonse['error']['message']);
    } else if (statusCode == 404) {
      return ServerFalier('Website Not Fount');
    } else if (statusCode == 500) {
      return ServerFalier(' Server Error');
    } else {
      return ServerFalier(' Some thing Wrong ');
    }
  }
}
