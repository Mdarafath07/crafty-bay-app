import 'package:flutter/material.dart';
class ProductScarchField extends StatelessWidget {
  const ProductScarchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey.withAlpha(40),
        filled: true,
        prefixIcon: Icon(Icons.search,color: Colors.grey,),
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)
        ),
      ),

    );
  }
}