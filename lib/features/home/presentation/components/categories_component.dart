import 'package:flutter/material.dart';
import 'package:mart_app/core/utils/media_query_values.dart';
import 'package:mart_app/features/home/data/models/category_model.dart';

import 'category_item_component.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategoryModel.categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: CategoryItemComponent(
              model: CategoryModel.categories[index],
            ),
          );
        },
      ),
    );
  }
}
