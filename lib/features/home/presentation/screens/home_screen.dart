import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/home/presentation/screens/widgets/circle_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(

          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navlogoSvg),
      actions: [
        CircleIconButton(icon: Icons.person, onTap: () {}),

        CircleIconButton(icon: Icons.call, onTap: () {}),
        CircleIconButton(icon: Icons.notifications, onTap: () {}),
      ],
    );
  }
}


