import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class BrandItem extends StatelessWidget {
  final Brand brand;
  final VoidCallback onTap;
  final int spacing;

  const BrandItem({
   super.key,
    required this.brand,
    required this.onTap,
    this.spacing = 1,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
         borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
      ),
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              StatusIndicator(status: brand.active.toString()),
              12.horizontalSpace,
              CommonImage(
                width: 48,
                height: 48,
                url: brand.img,
                errorRadius: 0,
                fit: BoxFit.cover,
              ),
              8.horizontalSpace,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      brand.title ?? '',
                      style: Style.interRegular(
                        size: 14,
                        color: Style.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                    8.verticalSpace,
                    if (brand.shopId == LocalStorage.getShop()?.id)
                      Row(
                        children: [
                          CircleButton(
                            onTap: onTap,
                            icon: FlutterRemix.pencil_line,
                          ),
                          8.horizontalSpace,
                        ],
                      ),
                  ],
                ),
              ),
              12.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
