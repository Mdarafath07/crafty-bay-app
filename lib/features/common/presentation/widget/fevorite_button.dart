import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
class fevouriteButton extends StatelessWidget {
  const fevouriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}