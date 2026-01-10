import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/common/presentation/providers/main_nav_controler_provider.dart';
import 'package:crafty_bay/features/home/presentation/screens/widgets/circle_icon_button.dart';
import 'package:crafty_bay/features/home/presentation/screens/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/features/home/presentation/screens/widgets/product_search_field.dart';
import 'package:crafty_bay/features/home/presentation/screens/widgets/section_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/constants.dart';
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
            children: [
              ProductScarchField(),
              HomeCarouselSlider(),
              SactionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  context.read<MainNavControlerProvider>().changeToCategories();
                },
              ),
              _buildCategoryList(),
              SactionHeader(title: 'Popular', onTapSeeAll: () {}),
              SizedBox(
                width: 160,
                child: Card(
                  elevation: 3,
                  shadowColor: AppColors.themeColor.withAlpha(50),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    spacing: 6,
                    children: [
                      Container(
                        width: 160,
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
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildCategoryList() {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryCard();
        },
        separatorBuilder: (context, index) => SizedBox(width: 8),
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
