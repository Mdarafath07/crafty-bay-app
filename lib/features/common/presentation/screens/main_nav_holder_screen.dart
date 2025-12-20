import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';
class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});
  static const String name = '/main-bottom-nav-holder';


  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.themeColor,

          items: [

        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Categories"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carts"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),

      ]),
    );
  }
}
