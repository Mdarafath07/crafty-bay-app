import 'package:crafty_bay/features/cart/presentation/widgets/Inc_dec_button.dart';
import 'package:crafty_bay/features/common/presentation/widget/fevorite_button.dart';
import 'package:crafty_bay/features/common/presentation/widget/rating_review.dart';
import 'package:crafty_bay/features/product/presentation/widgets/Size_picker.dart';
import 'package:crafty_bay/features/product/presentation/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../widgets/color_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = "/product-details";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          crossAxisAlignment: .start,
                          children: [
                            Expanded(
                              child: Text(
                                "NIKE shoe - new Arrival 2027",
                                style: textTheme.titleMedium,
                              ),
                            ),
                            IncDecButton(onChnage: (newValue) {}),
                          ],
                        ),
                        Row(
                          children: [
                            RatingView(),

                            TextButton(onPressed: (){}, child: Text("Reviews")),
                            fevouriteButton(),



                          ],
                        ),
                        Text("Color",style: textTheme.titleMedium,),
                        const SizedBox(height: 8),
                        ColorPicker(colors: ["Black","White","Red "], onChnage: (selectedColor) {  },),
                        const SizedBox(height: 8),
                        Text("Size",style: textTheme.titleMedium,),

                        SizePicker(size: ["S","M","L"], onChnage: (selectedSize) {  },),
                      ],

                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(textTheme),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme) {
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
