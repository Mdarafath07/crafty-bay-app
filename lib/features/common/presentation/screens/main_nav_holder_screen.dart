import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/common/presentation/providers/main_nav_controler_provider.dart';
import 'package:crafty_bay/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../category/presentation/screens/category_list_screen.dart';
class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});
  static const String name = '/main-bottom-nav-holder';


  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {
  final List<Widget> _screens =[
    HomeScreen(),
    CategoryListScreen(),
    HomeScreen(),
    HomeScreen(),


  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavControlerProvider>(
      builder: (context,mainNavControlerProvider,child) {
        return Scaffold(
          body: _screens[mainNavControlerProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
              selectedItemColor: AppColors.themeColor,
              currentIndex: mainNavControlerProvider.selectedIndex,
              onTap: mainNavControlerProvider.changeItem,

              items: [

            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carts"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),

          ]),
        );
      }
    );
  }
}
