import 'package:flutter/material.dart';

import 'color_theme.dart';

abstract class AppTexsts {
  static const grey30 = TextStyle(
    color: AppColors.black,
    fontSize: 30,
    //letterSpacing: 0.5,
    height: 1.364,

    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal,
  );
  static const black20 = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    height: 1.364,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static const black14 = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    height: 1.364,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
  );
  static const black14curs = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    height: 1.364,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.italic,
  );
  static const white20 = TextStyle(
    color: AppColors.whiteBackground,
    fontSize: 20,
    height: 1.364,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}
