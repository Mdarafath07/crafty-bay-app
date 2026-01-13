import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../app/assets_path.dart';
import '../../../../app/constants.dart';
import '../widgets/Inc_dec_button.dart';
import '../widgets/cart_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Carts")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: .symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: 10,

                itemBuilder: (context, index) {
                  return CartItem();
                },
              ),
            ),
          ),
          _buildTotalPriceAndChackuotSection(textTheme),
        ],
      ),
    );
  }

  Container _buildTotalPriceAndChackuotSection(TextTheme textTheme) {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(50),
        borderRadius: .only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,

        children: [
          Column(
            crossAxisAlignment: .start,

            children: [
              Text("Total Price", style: textTheme.bodyLarge),
              Text(
                "${Constants?.takaSign}500",
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: .w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          Column(),
          SizedBox(
            width: 120,
            child: FilledButton(onPressed: () {}, child: Text("Checkout")),
          ),
        ],
      ),
    );
  }
}
