import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import 'all_product_item.dart';

class AllProductsComponent extends StatelessWidget {
  const AllProductsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: ProductModel.products.length,
      itemBuilder: (BuildContext context, int index) {
        return AllProductItem(
          model: ProductModel.products[index],
        );
      },
    );
  }
}
