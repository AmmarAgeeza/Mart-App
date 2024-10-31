import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import '../utils/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: LoadingBouncingGrid.square(
          borderColor: AppColors.orange,
          borderSize: 3.0,
          size: 90.0,
          backgroundColor: AppColors.orange,
          duration: const Duration(milliseconds: 2500),
        ),
      ),
    );
  }
}
