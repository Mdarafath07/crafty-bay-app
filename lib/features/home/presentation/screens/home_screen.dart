import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/home/presentation/screens/widgets/circle_icon_button.dart';
import 'package:crafty_bay/features/home/presentation/screens/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/features/home/presentation/screens/widgets/product_search_field.dart';
import 'package:crafty_bay/features/home/presentation/screens/widgets/section_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/presentation/widget/category_card.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 8,
            children: [
              ProductScarchField(),
              HomeCarouselSlider(),
              SactionHeader(title: 'Categories', onTapSeeAll: () {}),
              _buildCategoryList(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildCategoryList() {
    return SizedBox(
              height: 95,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CategoryCard();
                },
                separatorBuilder: (context, index) => SizedBox(width:  8,),
              ),
            );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navlogoSvg),
      actions: [
        CircleIconButton(icon: Icons.person, onTap: () {}),
        SizedBox(width: 6),

        CircleIconButton(icon: Icons.call, onTap: () {}),
        SizedBox(width: 6),
        CircleIconButton(icon: Icons.notifications, onTap: () {}),
        SizedBox(width: 6),
      ],
    );
  }
}


