import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../../app/constants.dart';
import 'Inc_dec_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 3,
      shadowColor: AppColors.themeColor.withAlpha(50),
      color: Colors.white,
      child: Row(
        spacing: 4,
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Image.asset(AssetsPath.dummyImagePng, height: 90, width: 80),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              "NIke KH3434 - New Arrival show",
                              maxLines: 1,
                              style: textTheme.bodyLarge?.copyWith(
                                overflow: .ellipsis,
                              ),
                            ),
                            Text(
                              "Color: black, Size: 38",
                              style: textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "${Constants?.takaSign}500",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: .w600,
                          color: AppColors.themeColor,
                        ),
                      ),
                      IncDecButton(onChnage: (int value) {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
