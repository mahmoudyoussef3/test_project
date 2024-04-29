import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? iconData;
  final Function()? onTap;
  final int size;

  const CustomIconButton({
   super.key,
    required this.iconData,
    this.onTap,
    this.size = 40,
  }) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.r,
        height: size.r,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Style.primary,
        ),
        alignment: Alignment.center,
        child: Icon(
          iconData,
          size: 24.r,
          color: Style.white,
        ),
      ),
    );
  }
}
