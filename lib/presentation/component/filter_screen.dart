import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'title_icon.dart';
import '../styles/style.dart';
import 'helper/modal_drag.dart';
import 'helper/modal_wrap.dart';
import 'custom_date_picker.dart';
import 'buttons/custom_button.dart';
import 'tab_bars/custom_tab_bar.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class FilterScreen extends StatefulWidget {
  final bool isTabBar;
  final ValueChanged<List<DateTime?>> onChangeDay;

  const FilterScreen(
      {super.key, this.isTabBar = true, required this.onChangeDay});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<DateTime?> _rangeDatePicker = [DateTime.now(), DateTime.now()];

  final _tabs = [
    Tab(child: Text(AppHelpers.getTranslation(TrKeys.today))),
    Tab(
      child: Text(
        AppHelpers.getTranslation(TrKeys.weekly),
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    ),
    Tab(
      child: Text(
        AppHelpers.getTranslation(TrKeys.monthly),
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    ),
    Tab(
      child: Text(AppHelpers.getTranslation(TrKeys.overall)),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(
      () {
        switch (_tabController.index) {
          case 0:
            _rangeDatePicker = [
              DateTime.now(),
              DateTime.now(),
            ];
            break;
          case 1:
            _rangeDatePicker = [
              DateTime.now().subtract(const Duration(days: 7)),
              DateTime.now(),
            ];
            break;
          case 2:
            _rangeDatePicker = [
              DateTime.now().subtract(const Duration(days: 30)),
              DateTime.now(),
            ];
            break;
          case 3:
            _rangeDatePicker = [
              DateTime.now().subtract(const Duration(days: 120)),
              DateTime.now(),
            ];
            break;
        }
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModalDrag(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child:
                TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.filter)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              AppHelpers.getTranslation(TrKeys.selectDesiredOrderHistory),
              style: Style.interNormal(
                size: 14,
                color: Style.black,
                letterSpacing: -0.3,
              ),
            ),
          ),
          widget.isTabBar
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  child: CustomTabBar(
                    tabController: _tabController,
                    tabs: _tabs,
                  ),
                )
              : const SizedBox.shrink(),
          CustomDatePicker(range: _rangeDatePicker),
          16.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return CustomButton(
                  title: TrKeys.save,
                  onPressed: () {
                    context.popRoute();
                    widget.onChangeDay(_rangeDatePicker);
                  },
                );
              },
            ),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
