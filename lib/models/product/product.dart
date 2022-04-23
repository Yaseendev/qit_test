import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../utils/services/network_service.dart';
import '../rating/rating.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@Freezed()
class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required num price,
    required String description,
    required String category,
    required String image,
    required Rating rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

class ProductsAsyncNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  final NetworkService networkService;
  final String categoryName;
  ProductsAsyncNotifier(
      {required this.networkService, required this.categoryName})
      : super(AsyncLoading()) {
    _init();
  }
  void _init() async {
    await networkService.getCategoryProduct(categoryName).then((result) {
      state = AsyncData(result ?? []);
    }).onError((error, stackTrace) {
      state = AsyncError(NetworkService.getErrorMessage(error));
    });
  }
}
