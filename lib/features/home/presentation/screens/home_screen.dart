import 'package:flutter/material.dart';

import '../components/app_bar_component.dart';
import '../components/slider_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              //appBar Component + Sliders + Categories + Best Selling Products
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //appBar Component
                    AppBarComponent(),
                    //Sliders Component
                    SlidersComponent(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
