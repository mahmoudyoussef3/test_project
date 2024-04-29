import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: REdgeInsets.all(16),
    backgroundColor: Style.primary,
    minimumSize: const Size(double.infinity, 32),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  ),
);

TextButtonThemeData textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Style.success),
    textStyle: MaterialStateProperty.all(Style.interSemi(size: 16)),
  ),
);

OutlinedButtonThemeData outlinedButtonTheme(
    {Color borderColor = Style.primary}) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Style.success,
      padding: REdgeInsets.all(24),
      minimumSize: const Size(double.infinity, 32),
      side: BorderSide(width: 1.5, color: borderColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  );
}
