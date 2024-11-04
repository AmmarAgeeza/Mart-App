import 'package:flutter/material.dart';
import 'package:mart_app/core/utils/media_query_values.dart';
import 'package:mart_app/features/home/data/models/product_model.dart';

import 'product_item_component.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ProductModel.products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: ProductItemComponent(
              model: ProductModel.products[index],
            ),
          );
        },
      ),
    );
  }
}
