import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/product_model.dart';

class ProductItemComponent extends StatelessWidget {
  const ProductItemComponent({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150.w,
      padding: const EdgeInsetsDirectional.only(start: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          Expanded(
            child: Image.asset(
              model.imageUrl,
              fit: BoxFit.cover,
              width: 150.w,
              height: 150.h,
            ),
          ),
          Text(
            model.name,
          ),
        ],
      ),
    );
  }
}
