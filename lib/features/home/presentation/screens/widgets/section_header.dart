import 'package:flutter/material.dart';
class SactionHeader extends StatelessWidget {
  const SactionHeader({
    super.key, required this.title, required this.onTapSeeAll,
  });
  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [

        Text(title,style: TextTheme.of(context).titleMedium,),
        TextButton(onPressed: onTapSeeAll, child: Text("See all")),
      ],
    );
  }
}