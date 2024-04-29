import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';

class CustomTabBar extends StatelessWidget {
  final TabController? tabController;
  final List<Tab> tabs;

  const CustomTabBar({super.key, this.tabController, required this.tabs})
      ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      height: 48.h,
      decoration: BoxDecoration(
        color: Style.borderColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Style.primary,
        ),
        labelColor: Style.white,
        unselectedLabelColor: Style.textColor,
        unselectedLabelStyle: Style.interRegular(size: 14),
        labelStyle: Style.interSemi(size: 14),
        tabs: tabs,
      ),
    );
  }
}
