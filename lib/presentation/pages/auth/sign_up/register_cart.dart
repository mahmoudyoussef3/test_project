import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import '../../../styles/style.dart';

class RegisterCart extends StatefulWidget {
  final bool isOnlyEmail;
  final ValueChanged<String>? onChange;

  const RegisterCart({super.key, required this.isOnlyEmail, this.onChange})
      ;

  @override
  State<RegisterCart> createState() => _RegisterCartState();
}

class _RegisterCartState extends State<RegisterCart> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final event = ref.read(registerProvider.notifier);
      final state = ref.watch(registerProvider);
      return KeyboardDisable(
        child: Container(
          margin: MediaQuery.viewInsetsOf(context) / 1.2,
          width: double.infinity,
          child: Padding(
            padding: REdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.signUp),
                          style:
                              Style.interSemi(color: Style.textColor, size: 30),
                        ),
                        24.verticalSpace,
                        widget.isOnlyEmail
                            ? Column(
                                children: [
                                  CustomTextFormField(
                                    validation: AppValidators.emptyCheck,
                                    hint: TrKeys.phoneNumber,
                                    onChanged: event.setEmail,
                                  ),
                                  24.verticalSpace,
                                ],
                              )
                            : const SizedBox.shrink(),
                        widget.isOnlyEmail
                            ? const SizedBox.shrink()
                            : Column(
                                children: [
                                  (state.verificationId.isEmpty)
                                      ? 24.verticalSpace
                                      : 24.verticalSpace,
                                  (state.verificationId.isEmpty)
                                      ? CustomTextFormField(
                                          validation: AppValidators.emptyCheck,
                                          hint: TrKeys.phoneNumber,
                                          onChanged: event.setPhone,
                                        )
                                      : CustomTextFormField(
                                          validation: AppValidators.emptyCheck,
                                          hint: TrKeys.email,
                                          onChanged: event.setEmail,
                                        ),
                                  24.verticalSpace,
                                  CustomTextFormField(
                                    validation: AppValidators.emptyCheck,
                                    hint: TrKeys.firstname,
                                    onChanged: event.setFirstName,
                                  ),
                                  24.verticalSpace,
                                  CustomTextFormField(
                                    validation: AppValidators.emptyCheck,
                                    hint: TrKeys.lastname,
                                    onChanged: event.setLatName,
                                  ),
                                  24.verticalSpace,
                                  CustomTextFormField(
                                    obscure: state.showPassword,
                                    validation: AppValidators.passwordCheck,
                                    hint: TrKeys.password,
                                    onChanged: event.setPassword,
                                    suffixIcon: GestureDetector(
                                      onTap: event.toggleShowPassword,
                                      child: Icon(
                                        state.showPassword
                                            ? FlutterRemix.eye_line
                                            : FlutterRemix.eye_close_line,
                                        color: Style.icon,
                                        size: 20.r,
                                      ),
                                    ),
                                  ),
                                  24.verticalSpace,
                                  CustomTextFormField(
                                    obscure: state.showConfirmPassword,
                                    validation: (value) {
                                      return AppValidators.confirmPasswordCheck(
                                        value,
                                        state.password,
                                      );
                                    },
                                    hint: TrKeys.confirmPassword,
                                    onChanged: event.setConfirmPassword,
                                    suffixIcon: GestureDetector(
                                      onTap: event.toggleShowConfirmPassword,
                                      child: Icon(
                                        state.showPassword
                                            ? FlutterRemix.eye_line
                                            : FlutterRemix.eye_close_line,
                                        color: Style.icon,
                                        size: 20.r,
                                      ),
                                    ),
                                  ),
                                  24.verticalSpace,
                                ],
                              ),
                      ],
                    ),
                  ),
                  CustomButton(
                    isLoading: state.isLoading,
                    title: AppHelpers.getTranslation(TrKeys.signUp),
                    onPressed: () {
                      if (widget.isOnlyEmail) {
                        if (formKey.currentState?.validate() ?? false) {
                          (event.checkEmail()
                              ? event.sendCode(context, () {
                                  ref
                                      .read(authProvider.notifier)
                                      .switchScreen(2);
                                  widget.onChange?.call("");
                                })
                              : event.sendCodeToNumber(context, (s) {
                                  ref
                                      .read(authProvider.notifier)
                                      .switchScreen(2);
                                  widget.onChange?.call(s);
                                }));
                        }
                      } else {
                        if (formKey.currentState?.validate() ?? false) {
                          state.verificationId.isEmpty
                              ? event.register(context)
                              : event.registerWithPhone(context);
                        }
                      }
                    },
                  ),
                  widget.isOnlyEmail
                      ? const SizedBox.shrink()
                      : 24.verticalSpace,
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
