import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app_test/utils/providers.dart';

import 'product_card.dart';

class ProductsListView extends ConsumerWidget {
  final String categoryName;
  const ProductsListView(this.categoryName);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final products = watch(productsProvider(categoryName));
    return products.when(
      data: (data) {
        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4.sp,
          mainAxisSpacing: 4.sp,
          childAspectRatio: ((MediaQuery.of(context).size.width / 2) / 230.sp),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          children: data.map((product) => ProductCard(product)).toList(),
        );
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, st) => Center(
        child: Text('Error'),
      ),
    );
  }
}
