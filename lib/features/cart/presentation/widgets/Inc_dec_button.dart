import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key, required this.onChnage});

  final Function(int) onChnage;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: .spaceBetween,
      children: [
        _buildGestureDetector(
          onTap: () {
            if (_currentValue > 1) {
              _currentValue--;
              widget.onChnage(_currentValue);
              setState(() {});
            }
          },
          icon: Icons.remove,
        ),

        Text("$_currentValue", style: TextTheme.of(context).titleMedium),
        _buildGestureDetector(
          onTap: () {
            _currentValue++;
            widget.onChnage(_currentValue);
            setState(() {});
          },
          icon: Icons.add,
        ),
      ],
    );
  }

  Widget _buildGestureDetector({
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: .all(4),
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: .circular(4),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
