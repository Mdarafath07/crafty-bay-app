import 'package:crafty_bay/features/common/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductListByCategoryScreen extends StatefulWidget {
  const ProductListByCategoryScreen({super.key});

  static const String name = "/product-list-by-category";

  @override
  State<ProductListByCategoryScreen> createState() =>
      _ProductListByCategoryScreenState();
}

class _ProductListByCategoryScreenState
    extends State<ProductListByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Electornics")),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: ProductCard()),
          );

        },
      ),
    );
  }
}
