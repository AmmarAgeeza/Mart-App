import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles {
  static TextStyle medium16 = const TextStyle(
    fontSize: AppFonts.s16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle semiBold18 = const TextStyle(
    fontSize: AppFonts.s18,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static TextStyle bold22 = const TextStyle(
    fontSize: AppFonts.s22,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
  static TextStyle bold16 = const TextStyle(
    fontSize: AppFonts.s16,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
}
