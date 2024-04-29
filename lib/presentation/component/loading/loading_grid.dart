import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'package:venderuzmart/presentation/styles/style.dart';

class LoadingGrid extends StatelessWidget {
  final int itemCount;
  final int horizontalPadding;
  final int verticalPadding;
  final int itemBorderRadius;
  final int itemHeight;
  final int mainAxisSpacing;
  final int crossAxisCount;
  final int crossAxisSpacing;

  const LoadingGrid({
   super.key,
    this.itemCount = 10,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.itemBorderRadius = 10,
    this.itemHeight = 134,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 6,
    this.crossAxisSpacing = 6,
  }) ;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing.r,
          crossAxisSpacing: crossAxisSpacing.r,
          mainAxisExtent: itemHeight.r,
        ),
        itemCount: itemCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: REdgeInsets.symmetric(
          horizontal: horizontalPadding.r,
          vertical: verticalPadding.r,
        ),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: AppConstants.animationDuration,
            columnCount: itemCount,
            child: ScaleAnimation(
              scale: 0.5,
              child: FadeInAnimation(
                child: Container(
                  height: itemHeight.h,
                  decoration: BoxDecoration(
                    color: Style.white,
                    borderRadius: BorderRadius.circular(itemBorderRadius.r),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
