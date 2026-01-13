import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onChnage});
  final List<String> size;
  final Function(String) onChnage;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String size in widget.size)
          GestureDetector(
            onTap: () {
              setState(() {

                _selectedSize = size;
                widget.onChnage(_selectedSize!);
                setState(() {

                });
              });
            },
            child: Container(
              margin: .only(right: 8),
              padding: .symmetric(horizontal: 8,vertical: 4),
              decoration: BoxDecoration(


                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
                color: _selectedSize == size ? AppColors.themeColor : null,


              ),
              child: Text(size,style: TextStyle(color: _selectedSize == size ? Colors.white : null),),
            ),
          )

      ],
    );
  }
}
