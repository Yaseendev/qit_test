import 'dart:io';
import 'package:dio/dio.dart';
import 'package:store_app_test/models/category/category.dart';
import 'package:store_app_test/models/product/product.dart';
import '../constants.dart';

class NetworkService {
  final Dio _dio;
  NetworkService(this._dio);

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    Response response =
        await _dio.post('$BASE_URL/api/authaccount/login', data: {
      'email': email,
      'password': password,
    });
    return response.data;
  }

  Future<Map<String, dynamic>?> forgotPassword(String email) async {}

  Future<List<Category>?> getCategories() async {
    Response response = await _dio.get('$STORE_BASE_URL/categories');
    return (response.data as List<dynamic>)
        .map((name) => Category(name))
        .toList();
  }

  Future<List<Product>?> getCategoryProduct(String catName) async {
    Response response = await _dio.get('$STORE_BASE_URL/category/$catName');
    return (response.data as List<dynamic>)
        .map((product) => Product.fromJson(product))
        .toList();
  }

  static String getErrorMessage(error) {
    if (error is Exception) {
      try {
        String networkException;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkException = 'Request to server has been canceled';
              break;
            case DioErrorType.connectTimeout:
              networkException = 'No Internet Connection';
              break;
            case DioErrorType.other:
              networkException = 'Unknown Error';
              break;
            case DioErrorType.receiveTimeout:
              networkException =
                  'Receive timeout in connection with API server';
              break;
            case DioErrorType.response:
              print(error.response!.data);
              switch (error.response!.statusCode) {
                case 302:
                  networkException = 'Email or Password is incorrect';
                  break;
                case 400:
                  networkException = error.response!.data.toString();
                  break;
                case 401:
                  networkException = 'Unauthorised request';
                  break;
                case 403:
                  networkException = 'Unauthorised request';
                  break;
                case 404:
                  networkException = error.response!.data['message'];
                  break;
                case 409:
                  networkException = 'Error due to a conflict';
                  break;
                case 408:
                  networkException = 'Connection request timeout';
                  break;
                case 500:
                  networkException = 'Internal Server Error';
                  break;
                case 503:
                  networkException = 'Service is unavailable at the moment';
                  break;
                default:
                  final responseCode = error.response!.statusCode;
                  networkException =
                      'Received invalid status code: $responseCode';
              }
              break;
            case DioErrorType.sendTimeout:
              networkException = 'Send timeout in connection with API server';
              break;
          }
        } else if (error is SocketException) {
          networkException = 'No Internet Connection';
        } else {
          networkException = 'Unexpected error occurred ${error.toString()}';
        }
        return networkException;
      } on FormatException {
        return 'Unexpected error occurred ${error.toString()}';
      } catch (_) {
        return 'Unexpected error occurred';
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return 'Unable to process the data';
      } else {
        return 'Unexpected error occurred ${error.toString()}';
      }
    }
  }
}
