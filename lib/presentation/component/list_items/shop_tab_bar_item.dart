import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';

class ShopTabBarItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const ShopTabBarItem({
    super.key,
    required this.title,
    required this.isActive,
  }) ;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isActive ? Style.primary : Style.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Style.white.withOpacity(0.07),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 18.w),
      margin: EdgeInsets.only(right: 9.w),
      child: Text(
        title,
        style: Style.interNormal(
          size: 14,
          color: Style.black,
        ),
      ),
    );
  }
}
