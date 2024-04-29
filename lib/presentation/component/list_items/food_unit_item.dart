import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class FoodUnitItem extends StatelessWidget {
  final UnitData unit;
  final Function() onTap;
  final bool isSelected;

  const FoodUnitItem({
   super.key,
    required this.unit,
    required this.onTap,
    required this.isSelected,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: REdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 18.r,
                    height: 18.r,
                    decoration: BoxDecoration(
                      color: isSelected ? Style.primary : Style.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Style.black : Style.textColor,
                        width: isSelected ? 2 : 2,
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  Text(
                    '${unit.translation?.title}',
                    style: Style.interRegular(
                      size: 15,
                      color: Style.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
