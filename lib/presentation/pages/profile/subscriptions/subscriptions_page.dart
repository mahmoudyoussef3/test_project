import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/pages/profile/subscriptions/widgets/have_subscription.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import 'widgets/payment_dialog.dart';
import 'widgets/subscriptions_item.dart';

@RoutePage()
class SubscriptionsPage extends ConsumerStatefulWidget {
  const SubscriptionsPage({super.key}) ;

  @override
  ConsumerState<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends ConsumerState<SubscriptionsPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(subscriptionProvider.notifier)
          .fetchSubscriptions(isRefresh: true),
    );
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(subscriptionProvider);
            final notifier = ref.read(subscriptionProvider.notifier);
            int height = state.list.length < 5 &&
                    LocalStorage.getShop()?.subscription == null
                ? 0
                : 80;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAppBar(
                    bottomPadding: 12,
                    height: 102,
                    child: Row(
                      children: [
                        const PopButton(),
                        Text(
                          AppHelpers.getTranslation(TrKeys.subscriptions),
                          style: Style.interNormal(size: 16),
                        ),
                      ],
                    )),
                Expanded(
                  child: SmartRefresher(
                    controller: refreshController,
                    onRefresh: () => notifier.fetchSubscriptions(
                      context: context,
                      controller: refreshController,
                      isRefresh: true,
                    ),
                    child: state.isLoading
                        ? LoadingGrid(
                            verticalPadding: 12,
                            itemBorderRadius: 12,
                            horizontalPadding: 12,
                            itemHeight:
                                ((MediaQuery.sizeOf(context).height - 240.h) ~/
                                        2) -
                                    height,
                          )
                        : SingleChildScrollView(
                            padding: REdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              children: [
                                if (LocalStorage.getShop()?.subscription !=
                                    null)
                                  const HaveSubscription(),
                                state.list.isEmpty
                                    ? NoDataInfo(
                                        title: AppHelpers.getTranslation(
                                            TrKeys.noData))
                                    : GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: state.list.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisSpacing: 8.r,
                                                mainAxisSpacing: 4.r,
                                                crossAxisCount: 2,
                                                mainAxisExtent:
                                                    ((MediaQuery.sizeOf(context)
                                                                    .height -
                                                                148.h) /
                                                            2) -
                                                        height),
                                        padding: REdgeInsets.all(12),
                                        itemBuilder: (context, index) =>
                                            SubscriptionsItem(
                                          subscription: state.list[index],
                                          purchase: () {
                                            if (LocalStorage.getShop()
                                                    ?.subscription !=
                                                null) {
                                              notifier.fetchPayments(
                                                  context: context);
                                              notifier.selectSubscribe(
                                                  index: index);
                                              AppHelpers.showAlertDialog(
                                                  context: context,
                                                  child: const PaymentDialog());
                                            } else {
                                              AppHelpers.errorSnackBar(context,
                                                  text: AppHelpers
                                                      .getTranslation(TrKeys
                                                          .youHaveSubscription));
                                            }
                                          },
                                        ),
                                      ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
