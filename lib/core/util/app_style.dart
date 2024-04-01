

import 'package:flutter/material.dart';

import '../../app/functions/responsive_font_size.dart';

abstract class AppStyle{
static TextStyle textStyle20= TextStyle(
  fontSize: getResponsiveFontSize(22),
  fontWeight: FontWeight.w600,
);
static TextStyle textStyle15= TextStyle(
  fontSize: getResponsiveFontSize(17),
  fontWeight: FontWeight.w400,
);
static TextStyle textStyle14= TextStyle(
  fontSize: getResponsiveFontSize(16),
  fontWeight: FontWeight.w400,
);

static TextStyle textStyle30= TextStyle(
  fontSize: getResponsiveFontSize(25),
  fontWeight: FontWeight.w700,
);

}