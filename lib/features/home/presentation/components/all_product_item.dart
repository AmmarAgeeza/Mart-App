import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mart_app/core/utils/app_styles.dart';

import '../../data/models/product_model.dart';

class AllProductItem extends StatelessWidget {
  const AllProductItem({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // context.navigateTo(screenRoute: Routes.productDetails, arg: model.id);
        },
        child: SizedBox(
          height: 140.h,
          child: Row(
            children: [
              //image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  model.imageUrl,
                  fit: BoxFit.cover,
                  width: 115.w,
                  height: 140.h,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              //Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name of product
                    Text(
                      model.name,
                      style: AppStyles.semiBoldBlack18,
                    ),
                    //rating - no of rating
                    Row(
                      children: [
                        //rating
                        Card(
                          borderOnForeground: true,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  model.rating,
                                  style: AppStyles.semiBoldBlack18
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        //no of rating
                        Text(
                          model.noOfRating,
                          style: AppStyles.semiBoldOrang16,
                        ),
                      ],
                    ),
                    Flexible(
                      child: Text(
                        model.price,
                        style: AppStyles.semiBoldBlack18.copyWith(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
