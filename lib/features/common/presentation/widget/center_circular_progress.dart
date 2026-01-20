import 'package:flutter/material.dart';
class CenterCirculerProgress extends StatelessWidget {
  const CenterCirculerProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}