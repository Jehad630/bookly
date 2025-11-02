import 'package:dio/dio.dart';

abstract class Failure {
  final String errmesg;

  const Failure(this.errmesg);
}

class serverFaliure extends Failure {
  serverFaliure(super.errmesg);

  factory serverFaliure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return serverFaliure("Connection timeout with API service");

      case DioExceptionType.sendTimeout:
        return serverFaliure(
          "Send timeout — the request took too long to reach the server",
        );

      case DioExceptionType.receiveTimeout:
        return serverFaliure(
          "Receive timeout — the server took too long to respond",
        );

      case DioExceptionType.badCertificate:
        return serverFaliure("Bad certificate — SSL verification failed");

      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode;
        final errorMessage =
            dioError.response?.data.toString() ?? "Unknown server error";

        if (statusCode != null) {
          switch (statusCode) {
            case 400:
              return serverFaliure(
                "Bad request — invalid input sent to server",
              );
            case 401:
              return serverFaliure(
                "Unauthorized — please check your credentials",
              );
            case 403:
              return serverFaliure("Forbidden — you don't have permission");
            case 404:
              return serverFaliure("Not found — endpoint not available");
            case 500:
              return serverFaliure("Internal server error — try again later");
            default:
              return serverFaliure("Unexpected server error: $errorMessage");
          }
        } else {
          return serverFaliure("Bad response — no status code returned");
        }

      case DioExceptionType.cancel:
        return serverFaliure("Request to API server was cancelled");

      case DioExceptionType.connectionError:
        return serverFaliure(
          "Connection error — please check your internet connection",
        );

      case DioExceptionType.unknown:
        if (dioError.message?.contains("SocketException") ?? false) {
          return serverFaliure("No Internet connection");
        }
        return serverFaliure("Unexpected error occurred — please try again");
    }
  }
}
