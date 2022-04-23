import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_app_test/models/category/category.dart';
import 'package:store_app_test/models/product/product.dart';
import 'services/network_service.dart';

final networkServiceProvider =
    Provider<NetworkService>((ref) => NetworkService(Dio(BaseOptions(
          //baseUrl: BASE_URL,
          connectTimeout: 50000,
          receiveTimeout: 50000,
          contentType: 'application/json',
          headers: {
            "Access-Control-Allow-Origin":
                "*", // Required for CORS support to work
            "Access-Control-Allow-Credentials":
                true, // Required for cookies, authorization headers with HTTPS
            "Access-Control-Allow-Headers":
                "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS"
          },
        ))));

final categoriesProvider = FutureProvider.autoDispose<List<Category>?>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  return networkService.getCategories();
});

final productsProvider = StateNotifierProvider.family<
        ProductsAsyncNotifier, AsyncValue<List<Product>>, String>(
    (ref, catName) => ProductsAsyncNotifier(
          networkService: ref.watch(networkServiceProvider),
          categoryName: catName,
        ));
