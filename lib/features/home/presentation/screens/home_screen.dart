import 'package:flutter/material.dart';
import 'package:mart_app/features/home/presentation/components/title_see_more_component.dart';

import '../components/all_products_component.dart';
import '../components/app_bar_component.dart';
import '../components/categories_component.dart';
import '../components/recommended_products.dart';
import '../components/slider_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              //appBar Component + Sliders + Categories + Best Selling Products
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //appBar Component
                    const AppBarComponent(),
                    //Sliders Component
                    const SlidersComponent(),
                    // Categories
                    TitleSeeMoreComponent(title: 'Categories', onTab: () {}),
                    const CategoriesComponent(),
                    //Recommended Products
                    TitleSeeMoreComponent(title: 'Recommended ', onTab: () {}),
                    const RecommendedProducts(),
                    //All Products
                    TitleSeeMoreComponent(title: 'All Products ', onTab: () {}),
                  ],
                ),
              ),
              const AllProductsComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
