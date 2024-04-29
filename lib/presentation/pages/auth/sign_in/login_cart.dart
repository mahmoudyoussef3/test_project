import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/application/providers.dart';

import 'demo_login_item.dart';

class LoginCart extends StatefulWidget {
  const LoginCart({super.key});

  @override
  State<LoginCart> createState() => _LoginCartState();
}

class _LoginCartState extends State<LoginCart> {
  late TextEditingController email;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: formKey,
        child: Container(
          margin: MediaQuery.viewInsetsOf(context) / 2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Text(
                        AppHelpers.getTranslation(TrKeys.login),
                        style:
                            Style.interSemi(color: Style.textColor, size: 30),
                      ),
                      32.verticalSpace,
                      CustomTextFormField(
                        validation: AppValidators.emptyCheck,
                        controller: email,
                        hint: TrKeys.emailOrPhoneNumber,
                      ),
                      16.verticalSpace,
                      Consumer(
                        builder: (context, ref, child) {
                          final state = ref.watch(loginProvider);
                          final notifier = ref.read(loginProvider.notifier);
                          return CustomTextFormField(
                            obscure: state.showPassword,
                            controller: password,
                            validation: AppValidators.passwordCheck,
                            hint: TrKeys.password,
                            suffixIcon: IconButton(
                              onPressed: () {
                                notifier.toggleShowPassword();
                              },
                              icon: Icon(
                                !state.showPassword
                                    ? FlutterRemix.eye_close_line
                                    : FlutterRemix.eye_line,
                                color: Style.textColor,
                              ),
                            ),
                          );
                        },
                      ),
                      16.verticalSpace,
                      Consumer(
                        builder: (context, ref, child) {
                          final state = ref.watch(loginProvider);
                          final notifier = ref.read(loginProvider.notifier);
                          return CustomButton(
                              isLoading: state.isLoading,
                              title: AppHelpers.getTranslation(TrKeys.signIn),
                              background: Style.primary,
                              textColor: Style.white,
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  notifier.login(
                                    context,
                                    email: email.text,
                                    password: password.text,
                                    checkYourNetwork: () =>
                                        AppHelpers.errorSnackBar(
                                      context,
                                      text: AppHelpers.getTranslation(
                                          TrKeys.checkYourNetworkConnection),
                                    ),
                                    loginSuccess: () {
                                      if (AppHelpers.getUserRole ==
                                          TrKeys.master) {
                                        Navigator.pop(context);
                                        context.router.popUntilRoot();
                                        ref
                                            .read(notificationProvider.notifier)
                                            .fetchCount(context);
                                        context.replaceRoute(const MainRoute());
                                      } else {
                                        ref
                                            .read(shopProvider.notifier)
                                            .fetchMyShop(
                                          afterFetched: () {
                                            Navigator.pop(context);
                                            context.router.popUntilRoot();
                                            ref
                                                .read(notificationProvider
                                                    .notifier)
                                                .fetchCount(context);
                                            context.replaceRoute(
                                                const MainRoute());
                                          },
                                        );
                                      }
                                    },
                                    accessDenied: () {
                                      Navigator.pop(context);
                                      context.router.popUntilRoot();
                                      context.replaceRoute(
                                          const CreateShopRoute());
                                    },
                                  );
                                }
                              });
                        },
                      ),
                      24.verticalSpace,
                    ],
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  return ButtonEffectAnimation(
                    onTap: () {
                      ref.read(authProvider.notifier).switchScreen(5);
                    },
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.forgetPassword),
                      style: Style.interNormal(color: Style.textColor),
                    ),
                  );
                }),
                if (AppConstants.demoMode)
                  Column(
                    children: [
                      16.verticalSpace,
                      const Divider(color: Style.icon),
                      12.verticalSpace,
                      DemoLoginItem(
                        login: AppConstants.demoSellerLogin,
                        password: AppConstants.demoSellerPassword,
                        onTap: () {
                          email.text=AppConstants.demoSellerLogin;
                          password.text=AppConstants.demoSellerPassword;
                        },
                      ),
                      12.verticalSpace,
                      DemoLoginItem(
                        login: AppConstants.demoMasterLogin,
                        password: AppConstants.demoMasterPassword,
                        onTap: () {
                          email.text=AppConstants.demoMasterLogin;
                          password.text=AppConstants.demoMasterPassword;
                        },
                      ),
                    ],
                  ),
                32.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
