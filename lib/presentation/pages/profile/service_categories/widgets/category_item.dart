import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData categoryData;
  final ValueChanged<CategoryData?> onEdit;
  final ValueChanged<int?> onTap;
  final ValueChanged<int?> onTapSub;
  final int spacing;
  final List<int> selectParents;
  final List<int> selectSubs;

  const CategoryItem({
    super.key,
    required this.categoryData,
    required this.onEdit,
    this.spacing = 1,
    required this.onTap,
    required this.selectParents,
    required this.selectSubs,
    required this.onTapSub,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: spacing.r),
      child: Column(
        children: [
          categoryItem(
            category: categoryData,
            isSelect: selectParents.contains(categoryData.id),
            isEmpty: categoryData.children?.isEmpty ?? true,
          ),
        ],
      ),
    );
  }

  Widget categoryItem({
    required CategoryData? category,
    bool isSelect = false,
    bool isEnd = false,
    bool isFirst = false,
    bool isEmpty = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: REdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          if (isFirst) const Divider(height: 6),
          6.verticalSpace,
          Row(
            children: [
              Container(
                width: 4.r,
                height: 52.r,
                decoration: BoxDecoration(
                  color:
                      AppHelpers.getStatusColor(category?.active.toString()),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                ),
              ),
              12.horizontalSpace,
              CommonImage(
                width:  52.r ,
                height:  52.r ,
                url: category?.img,
                errorRadius: 0,
                fit: BoxFit.cover,
              ),
              8.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category?.translation?.title ??
                          AppHelpers.getTranslation(TrKeys.noName),
                      style: Style.interRegular(
                        size: 14,
                        color: Style.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                    6.verticalSpace,
                    Text(
                      category?.translation?.description ?? '',
                      style: Style.interRegular(
                        size: 12,
                        color: Style.textColor,
                        letterSpacing: -0.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  StatusButton(
                    status: category?.status ?? '',
                    verticalPadding: 4,
                    horizontalPadding: 12,
                  ),
                  6.verticalSpace,
                  Row(
                    children: [
                      if (category?.shopId == LocalStorage.getShop()?.id)
                        CircleButton(
                          onTap: () => onEdit(category),
                          icon: FlutterRemix.pencil_line,
                        ),
                    ],
                  ),
                ],
              ),
              12.horizontalSpace,
            ],
          ),
          6.verticalSpace,
          if (isEnd) 4.verticalSpace,
        ],
      ),
    );
  }
}
