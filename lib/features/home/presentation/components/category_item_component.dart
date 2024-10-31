import 'package:flutter/material.dart';
import 'package:mart_app/core/utils/media_query_values.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/category_model.dart';

class CategoryItemComponent extends StatelessWidget {
  const CategoryItemComponent({
    super.key,
    required this.model,
  });

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  model.imageUrl,
                  height: context.height * 0.12,
                ),
              ),
              Container(
                height: 27,
                width: 100,
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: AppColors.orange),
                child: Text(
                  model.name,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
