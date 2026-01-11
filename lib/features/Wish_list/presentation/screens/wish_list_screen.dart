import 'package:flutter/material.dart';

import '../../../common/presentation/widget/product_card.dart';
class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  static const String name = "/wish_list";

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wish List")),
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
