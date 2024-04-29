import 'package:venderuzmart/presentation/pages/auth/languages/languages_modal.dart';
import 'package:venderuzmart/presentation/styles/theme/theme/theme_wrapper.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'widgets/sections_item.dart';
import 'widgets/logout_modal.dart';
import 'widgets/wallet_widget.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (AppHelpers.getUserRole == TrKeys.master) {
        ref
            .read(editMastersProvider.notifier)
            .setMaster(LocalStorage.getUser());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: ThemeWrapper(
        builder: (colors, controller) {
          return Directionality(
            textDirection: LocalStorage.getLangLtr(),
            child: SafeArea(
              bottom: false,
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: () {
                  ref.read(profileProvider.notifier).fetchUser(context,
                      refreshController: _refreshController);
                  if (AppHelpers.getUserRole != TrKeys.master) {
                    ref.read(shopProvider.notifier).fetchMyShop();
                  }
                },
                child: SingleChildScrollView(
                  padding: REdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _appBar(),
                      8.verticalSpace,
                      AppHelpers.getUserRole == TrKeys.master
                          ? _masterBody()
                          : _sellerBody(),
                      SectionsItem(
                        title: AppHelpers.getTranslation(TrKeys.chats),
                        icon: FlutterRemix.messenger_line,
                        onTap: () => context.pushRoute(const ChatListRoute()),
                      ),
                      SectionsItem(
                        title: AppHelpers.getTranslation(TrKeys.language),
                        icon: FlutterRemix.global_line,
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ref
                                .read(languagesProvider.notifier)
                                .getLanguages(context);
                          });

                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            paddingTop: 350.r,
                            modal: LanguagesModal(
                              afterUpdate: () {
                                controller.toggle();
                                controller.toggle();
                                // context.router.removeUntil((route) => false);
                                // context.pushRoute(const SplashRoute());
                              },
                            ),
                          );
                        },
                      ),
                      SectionsItem(
                        title: AppHelpers.getTranslation(TrKeys.logout),
                        icon: FlutterRemix.logout_circle_line,
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: const LogoutModal(),
                          );
                        },
                      ),
                      if (AppConstants.appStoreMode)
                        SectionsItem(
                          title:
                              AppHelpers.getTranslation(TrKeys.deleteAccount),
                          icon: FlutterRemix.logout_box_line,
                          onTap: () {
                            AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: const LogoutModal(isDeleteAccount: true),
                            );
                          },
                        ),
                      124.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _appBar() {
    final user = ref.watch(profileProvider).userData ?? LocalStorage.getUser();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        16.verticalSpace,
        GestureDetector(
          onTap: () {
            context.pushRoute(EditProfileRoute(onSuccess: () {}));
          },
          child: Row(
            children: [
              CommonImage(
                url: user?.img,
                height: 54,
                width: 54,
                radius: 27,
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.firstname ?? "",
                      style: Style.interSemi(size: 16),
                      maxLines: 1,
                    ),
                    Text(
                      AppHelpers.getTranslation(
                        user?.role ?? TrKeys.seller,
                      ),
                      style:
                          Style.interRegular(color: Style.textColor, size: 14),
                    )
                  ],
                ),
              ),
              const Icon(FlutterRemix.edit_2_line)
            ],
          ),
        ),
        16.verticalSpace,
        const WalletScreen(),
      ],
    );
  }

  _masterBody() {
    return Column(
      children: [
        SectionsItem(
          title: AppHelpers.getTranslation(TrKeys.service),
          icon: FlutterRemix.scissors_cut_line,
          onTap: () => context.pushRoute(const ServiceMasterRoute()),
        ),
        SectionsItem(
          title: AppHelpers.getTranslation(TrKeys.workingHours),
          icon: Icons.work_history_outlined,
          onTap: () => context.pushRoute(WorkingTimeRoute()),
        ),
        SectionsItem(
          title: AppHelpers.getTranslation(TrKeys.gallery),
          icon: FlutterRemix.gallery_line,
          onTap: () => context.pushRoute(const MasterGalleryRoute()),
        ),
        SectionsItem(
          title: AppHelpers.getTranslation(TrKeys.formOptions),
          icon: FlutterRemix.article_line,
          onTap: () => context.pushRoute(const FormOptionRoute()),
        ),
      ],
    );
  }

  _sellerBody() {
    return Column(
      children: [
        SectionsItem(
          title: AppHelpers.getTranslation(TrKeys.shop),
          icon: FlutterRemix.store_2_line,
          onTap: () => context.pushRoute(const EditShopRoute()),
        ),
        SectionsItem(
          title: AppHelpers.getTranslation(TrKeys.masters),
          icon: FlutterRemix.group_line,
          onTap: () => context.pushRoute(const MastersRoute()),
        ),
        SectionsItem(
          title: AppHelpers.getTranslation(TrKeys.stories),
          icon: FlutterRemix.time_line,
          onTap: () => context.pushRoute(const StoriesRoute()),
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.zero,
          iconColor: Style.black,
          collapsedIconColor: Style.black,
          title: SectionsItem(
            title: AppHelpers.getTranslation(TrKeys.products),
            icon: FlutterRemix.archive_line,
            onTap: () => context.pushRoute(const ProductsRoute()),
          ),
          children: [
            SectionsItem(
              title: AppHelpers.getTranslation(TrKeys.categories),
              icon: FlutterRemix.layout_grid_line,
              onTap: () => context.pushRoute(const CategoryRoute()),
            ),
            SectionsItem(
              title: AppHelpers.getTranslation(TrKeys.brand),
              icon: FlutterRemix.gradienter_line,
              onTap: () => context.pushRoute(const BrandsRoute()),
            ),
            SectionsItem(
              title: AppHelpers.getTranslation(TrKeys.looks),
              icon: FlutterRemix.typhoon_line,
              onTap: () => context.pushRoute(const LooksRoute()),
            ),
            SectionsItem(
              title: AppHelpers.getTranslation(TrKeys.discount),
              icon: FlutterRemix.percent_line,
              onTap: () => context.pushRoute(const DiscountRoute()),
            ),
            SectionsItem(
              title: AppHelpers.getTranslation(TrKeys.extras),
              icon: FlutterRemix.add_box_line,
              onTap: () => context.pushRoute(const ExtrasRoute()),
            ),
          ],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.zero,
          iconColor: Style.black,
          collapsedIconColor: Style.black,
          title: SectionsItem(
            title: AppHelpers.getTranslation(TrKeys.service),
            icon: FlutterRemix.scissors_cut_line,
            onTap: () => context.pushRoute(const ServiceRoute()),
          ),
          children: [
            SectionsItem(
              title: AppHelpers.getTranslation(TrKeys.serviceCategories),
              icon: FlutterRemix.layout_grid_line,
              onTap: () => context.pushRoute(const ServiceCategoryRoute()),
            )
          ],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.zero,
          iconColor: Style.black,
          collapsedIconColor: Style.black,
          title: SectionsItem(
            title: AppHelpers.getTranslation(TrKeys.membership),
            icon: Icons.verified_outlined,
            onTap: () => context.pushRoute(const MembershipRoute()),
          ),
          children: [
            SectionsItem(
              title: AppHelpers.getTranslation(TrKeys.userMembership),
              icon: Icons.verified_outlined,
              onTap: () => context.pushRoute(const UserMembershipRoute()),
            ),
          ],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.zero,
          iconColor: Style.black,
          collapsedIconColor: Style.black,
          title: SectionsItem(
            title: AppHelpers.getTranslation(TrKeys.giftCards),
            icon: FlutterRemix.gift_2_line,
            onTap: () => context.pushRoute(const GiftCardsRoute()),
          ),
          children: [
            SectionsItem(
              title: AppHelpers.getTranslation(TrKeys.userGiftCards),
              icon: FlutterRemix.gift_line,
              onTap: () {
                context.pushRoute(const UserGiftCardRoute());
              },
            ),
          ],
        ),
        if ((ref.watch(shopProvider).shop ?? LocalStorage.getShop())
                ?.deliveryType ==
            2)
          SectionsItem(
            title: AppHelpers.getTranslation(TrKeys.deliveries),
            icon: FlutterRemix.truck_line,
            onTap: () {
              context.pushRoute(const DeliveriesRoute());
            },
          ),
        if (AppHelpers.getAds())
          SectionsItem(
            title: AppHelpers.getTranslation(TrKeys.adPackages),
            icon: FlutterRemix.advertisement_line,
            onTap: () => context.pushRoute(const AdsPackageRoute()),
          ),
        if (AppHelpers.getAds())
          SectionsItem(
            title: AppHelpers.getTranslation(TrKeys.ads),
            icon: FlutterRemix.advertisement_line,
            onTap: () => context.pushRoute(const AdsRoute()),
          ),
        if (AppHelpers.getSubscription())
          SectionsItem(
            title: AppHelpers.getTranslation(TrKeys.subscriptions),
            icon: Icons.verified_outlined,
            onTap: () => context.pushRoute(const SubscriptionsRoute()),
          ),
        SectionsItem(
          title: AppHelpers.getTranslation(TrKeys.comments),
          icon: FlutterRemix.chat_1_line,
          onTap: () => context.pushRoute(const CommentsRoute()),
        ),
        SectionsItem(
          title: AppHelpers.getTranslation(TrKeys.formOptions),
          icon: FlutterRemix.article_line,
          onTap: () => context.pushRoute(const FormOptionRoute()),
        ),
        SectionsItem(
          title: AppHelpers.getTranslation(TrKeys.orderHistory),
          icon: FlutterRemix.history_line,
          onTap: () => context.pushRoute(const OrderHistoryRoute()),
        ),
        // SectionsItem(
        //   title: AppHelpers.getTranslation(TrKeys.users),
        //   icon: FlutterRemix.shield_user_line,
        //   onTap: () {
        //     context.pushRoute(const UsersRoute());
        //   },
        // ),
      ],
    );
  }
}
