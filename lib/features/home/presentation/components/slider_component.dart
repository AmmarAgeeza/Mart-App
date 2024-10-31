import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mart_app/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';

class SlidersComponent extends StatefulWidget {
  const SlidersComponent({super.key});

  @override
  State<SlidersComponent> createState() => _SlidersComponentState();
}

class _SlidersComponentState extends State<SlidersComponent> {
  int sliderIndex = 0;

  void changeSliderIndex(index) {
    sliderIndex = index;
    setState(() {});
  }

  List<String> sliders = [
    'https://media.istockphoto.com/id/155358719/photo/mini-burgers.webp?a=1&b=1&s=612x612&w=0&k=20&c=IEfdIlpqIeTfc8Wut5i-5a0gzpP1-Qx2Tp7JchTG0Us=',
    'https://images.unsplash.com/photo-1554374814-6f1baaa46062?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                changeSliderIndex(index);
              },
              // autoPlay: true,
              aspectRatio: 2.1,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
            ),
            items: List.generate(
              sliders.length,
              (int index) => SizedBox(
                width: context.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CustomCachedNetworkImage(
                    imageUrl: sliders[index],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: sliders.map((url) {
              int index = sliders.indexOf(url);
              return Container(
                width: 30.0,
                height: 3.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 2.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: sliderIndex == index ? AppColors.orange : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
