import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'widgets/service_item.dart';

@RoutePage()
class CreateEventPage extends ConsumerStatefulWidget {
  const CreateEventPage({super.key});

  @override
  ConsumerState<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends ConsumerState<CreateEventPage> {
  late RefreshController _refreshController;
  num totalPrice = 0;
  num duration = 0;
  int service = 0;

  @override
  void initState() {
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.refresh(createBookingProvider.notifier).fetchServices(
              context: context,
              isRefresh: true,
            );
      ref.read(orderUserProvider.notifier).clearSelectedUserInfo();
    });
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createBookingProvider);
    final notifier = ref.read(createBookingProvider.notifier);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Style.white,
        body: Stack(
          children: [
            Column(
              children: [
                CustomAppBar(
                  height: 90,
                  bottomPadding: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppHelpers.getTranslation(TrKeys.createBooking)),
                    ],
                  ),
                ),
                Expanded(
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: true,
                    onRefresh: () => notifier.fetchServices(
                      controller: _refreshController,
                      context: context,
                      isRefresh: true,
                    ),
                    onLoading: () => notifier.fetchServices(
                      controller: _refreshController,
                      context: context,
                    ),
                    child: SingleChildScrollView(
                      padding: REdgeInsets.all(16),
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          const SelectUserWidget(),
                          16.verticalSpace,
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 100.r),
                              itemCount: state.services.length,
                              itemBuilder: (context, index) {
                                return ServiceItem(
                                  booked: state.selectServices.any((element) =>
                                      element.id == state.services[index].id),
                                  service: state.services[index],
                                  onTap: () {
                                    notifier.setSelectedService(
                                        service: state.services[index],
                                        onChange: (services) {
                                          totalPrice = 0;
                                          duration = 0;
                                          service = 0;
                                          if (services.isEmpty) {
                                            return;
                                          }
                                          for (var element in services) {
                                            totalPrice +=
                                                (element.totalPrice ?? 0);
                                            duration += (element.interval ?? 0);
                                          }
                                          service = services.length;
                                        });
                                  },
                                );
                              }),
                          16.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (state.isLoading) const CustomLoading()
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const BlackPopButton(),
              12.horizontalSpace,
              Expanded(
                child: ButtonEffectAnimation(
                  onTap: () {
                    if (state.selectServices.isEmpty) return;
                    final user = ref.read(orderUserProvider).selectedUser;
                    if (user == null) {
                      AppHelpers.errorSnackBar(context,
                          text: AppHelpers.getTranslation(
                              TrKeys.pleaseSelectAUser));
                      return;
                    }
                    notifier.setUser(user);
                    if(AppHelpers.getUserRole == TrKeys.master){
                      notifier.selectAllMaster();
                      context.pushRoute(const SelectBookTimeRoute());
                    }else{
                      notifier.clearMaster();
                      context.pushRoute( const SelectMastersRoute());
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16.r),
                    height: 64.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Style.primary,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${AppHelpers.getTranslation(TrKeys.from)} ${AppHelpers.numberFormat(number: totalPrice)}",
                          style: Style.interNormal(color: Style.white, size: 16),
                        ),
                        Text(
                          "$service ${AppHelpers.getTranslation(TrKeys.services)} - $duration ${AppHelpers.getTranslation(TrKeys.minute)}",
                          style: Style.interRegular(color: Style.white, size: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
