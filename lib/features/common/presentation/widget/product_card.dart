import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../../app/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        elevation: 3,
        shadowColor: AppColors.themeColor.withAlpha(50),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          spacing: 6,
          children: [
            Container(
              width: 150,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: .circular(8),
                  topLeft: .circular(8),
                ),
                color: AppColors.themeColor.withAlpha(40),
                image: DecorationImage(
                  image: AssetImage(AssetsPath.dummyImagePng),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "NIKE shoe - new Arrival",
                    maxLines: 1,
                    style: TextStyle(overflow: .ellipsis),
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "${Constants.takaSign}200",
                        style: TextStyle(
                          fontWeight: .w600,
                          color: AppColors.themeColor,
                        ),
                      ),
                      Wrap(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 15),
                          Text("4.4"),
                        ],
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(4),
                        ),
                        color: AppColors.themeColor,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.favorite_outline,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
