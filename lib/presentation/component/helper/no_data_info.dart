import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/app_assets.dart';

import 'package:venderuzmart/presentation/styles/style.dart';

class NoDataInfo extends StatelessWidget {
  final String title;

  const NoDataInfo({super.key, required this.title}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.imageNoOrders, width: 205.w, height: 206.h),
          Text(
            title,
            style: Style.interRegular(
              size: 14,
              color: Style.black,
              letterSpacing: -0.3,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
