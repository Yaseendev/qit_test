import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app_test/models/product/product.dart';
import 'package:store_app_test/utils/constants.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard(this.product);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: PRODUCTCARD_COLOR,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Stack(
          children: [
            
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: PRODUCTIMAGE_COLOR.withAlpha(20),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(
                      widget.product.image,
                      height: 130.sp,
                      //fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      widget.product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '\$ ${widget.product.price}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BACKGROUND_COLOR,
                ),
                child: Row(
                  children: [
                    Text(widget.product.price.toString()),
                    Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                  ],
                ),
                 
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                 
              ),
            ),
            Positioned(
              bottom: 55,
              right: 5,
              child: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: BACKGROUND_COLOR,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
