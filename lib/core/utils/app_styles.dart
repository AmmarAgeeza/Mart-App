import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles {
  static const TextStyle mediumBlack16 =  TextStyle(
    fontSize: AppFonts.s16,
    fontWeight: AppFonts.medium,
    color: AppColors.black,
  );
  static const TextStyle boldBlack22 =  TextStyle(
    fontSize: AppFonts.s22,
    fontWeight: AppFonts.bold,
    color: AppColors.black,
  );
  static const TextStyle boldWhite16 =  TextStyle(
    fontSize: AppFonts.s16,
    fontWeight: AppFonts.bold,
    color: AppColors.white,
  );
  static const TextStyle semiBoldOrang16 =  TextStyle(
    fontSize: AppFonts.s16,
    fontWeight: AppFonts.semiBold,
    color: AppColors.orange,
  );
}
