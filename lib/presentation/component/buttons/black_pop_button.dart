import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class BlackPopButton extends StatelessWidget {
  final String? heroTag;

  const BlackPopButton({super.key, this.heroTag});

  @override
  Widget build(BuildContext context) {
    if (heroTag?.isNotEmpty ?? false) {
      return Hero(
        tag: heroTag!,
        child: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 28.r,
          onPressed: () {
            context.popRoute();
          },
          icon: Icon(
            FlutterRemix.arrow_left_s_line,
            color: Style.black,
            size: 28.r,
          ),
        ),
      );
    } else {
      return Container(
        padding: REdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Style.black,
          borderRadius: BorderRadius.circular((AppConstants.radius/1.2).r),
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 28.r,
          onPressed: () {
            context.popRoute();
          },
          icon: Icon(
            FlutterRemix.arrow_left_s_line,
            color: Style.white,
            size: 28.r,
          ),
        ),
      );
    }
  }
}
