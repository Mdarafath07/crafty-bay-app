import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/providers/main_nav_controler_provider.dart';
import '../../../common/presentation/widget/category_card.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __,){
        context.read<MainNavControlerProvider>().backToHome();

      },
      canPop: false,
      child: Scaffold(


        appBar: AppBar(
          leading: IconButton(onPressed: (){
            context.read<MainNavControlerProvider>().backToHome();
          }, icon: Icon(Icons.arrow_back_ios)),

            title: Text("Categories")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ), itemBuilder: (context,  index) {
              return CategoryCard(

              );

          },


          ),
        ),
      ),
    );
  }
}
