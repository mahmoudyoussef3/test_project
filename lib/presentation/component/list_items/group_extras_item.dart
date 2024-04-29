import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import '../color_item.dart';

class GroupExtrasItem extends StatelessWidget {
  final Extras extras;
  final Function() onTap;
  final bool isSelected;

  const GroupExtrasItem({
   super.key,
    required this.extras,
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
                  Container(
                    width: 18.r,
                    height: 18.r,
                    margin: EdgeInsets.only(right: 10.r),
                    decoration: BoxDecoration(
                      color: isSelected ? Style.primary : Style.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: !isSelected ? Style.textHint : Style.primary),
                    ),
                    child: Icon(
                      FlutterRemix.check_line,
                      color: Style.white,
                      size: 16.r,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Text(
                      AppHelpers.getNameColor(extras.value),
                      style: Style.interRegular(
                        size: 15,
                        color: Style.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  if (extras.group?.type == ExtrasType.color.name)
                    ColorItem(extras: extras)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
