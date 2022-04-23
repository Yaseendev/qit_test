import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_app_test/utils/providers.dart';
import 'package:store_app_test/utils/services/network_service.dart';
import '../utils/constants.dart';
import '../widgets/products_list_widget.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return context.refresh(categoriesProvider);
      },
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: BACKGROUND_COLOR,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined),
            ),
          ],
        ),
        body: Consumer(
          builder: (context, watch, child) {
            final categories = watch(categoriesProvider);
            return categories.when(
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                data: (data) {
                  //final tabs = List.
                  // Defaul
                  return DefaultTabController(
                    length: data!.length,
                    child: Column(
                      children: [
                        TabBar(
                          tabs: data
                              .map((category) => Tab(
                                    text: category.name,
                                  ))
                              .toList(),
                          indicatorColor: Colors.transparent,
                          isScrollable: true,
                        ),
                        Expanded(
                          child: TabBarView(
                              children: List.generate(
                                  data.length,
                                  (index) =>
                                      ProductsListView(data[index].name))),
                        ),
                      ],
                    ),
                  );
                },
                error: (e, st) => Center(
                      child: Text(
                        NetworkService.getErrorMessage(e),
                        style: TextStyle(color: Colors.white),
                      ),
                    ));
          },
        ),
      ),
    );
  }
}
