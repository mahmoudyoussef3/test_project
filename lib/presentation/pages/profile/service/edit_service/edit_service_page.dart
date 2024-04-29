import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import '../../../../component/components.dart';
import '../../../../styles/style.dart';
import '../widgets/service_categories_modal.dart';

@RoutePage()
class EditServicePage extends ConsumerStatefulWidget {
  final int? id;

  const EditServicePage(this.id, {super.key});

  @override
  ConsumerState<EditServicePage> createState() => _EditLooksPageState();
}

class _EditLooksPageState extends ConsumerState<EditServicePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController desc;
  late TextEditingController pause;
  late TextEditingController price;
  late TextEditingController interval;
  late TextEditingController category;
  CategoryData? selectCategory;

  @override
  void initState() {
    final ServiceData? serviceData = ref.read(editServiceProvider).serviceData;
    title = TextEditingController(text: serviceData?.translation?.title ?? '');
    desc = TextEditingController(
        text: serviceData?.translation?.description ?? '');
    pause = TextEditingController(text: "${serviceData?.pause ?? 0}");
    price = TextEditingController(text: "${serviceData?.price ?? 0}");
    interval = TextEditingController(text: "${serviceData?.interval ?? ''}");
    category = TextEditingController(
        text: "${serviceData?.category?.translation?.title ?? 0}");
    selectCategory = serviceData?.category;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(editServiceProvider.notifier).fetchServiceDetails(
          context: context,
          id: widget.id,
          onSuccess: (ServiceData? value) {
            selectCategory = value?.category;
            desc.text = value?.translation?.description ?? '';
            category.text = value?.category?.translation?.title ?? '';
          }),
    );
  }

  @override
  void dispose() {
    title.dispose();
    desc.dispose();
    pause.dispose();
    price.dispose();
    interval.dispose();
    category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editServiceProvider);
    final notifier = ref.read(editServiceProvider.notifier);
    return KeyboardDisable(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            CommonAppBar(
              child: Row(
                children: [
                  const PopButton(),
                  Text(AppHelpers.getTranslation(TrKeys.editService)),
                ],
              ),
            ),
            Expanded(
              child: state.serviceData == null || state.isLoading
                  ? const Loading()
                  : Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            24.verticalSpace,
                            MultiImagePicker(
                              imageUrls: state.listOfUrls,
                              listOfImages: state.images,
                              onImageChange: notifier.setImageFile,
                              onDelete: notifier.deleteImage,
                              isExtras: true,
                            ),
                            16.verticalSpace,
                            UnderlinedTextField(
                              label:
                                  '${AppHelpers.getTranslation(TrKeys.title)}*',
                              textInputAction: TextInputAction.next,
                              textController: title,
                              validator: AppValidators.emptyCheck,
                            ),
                            12.verticalSpace,
                            UnderlinedTextField(
                              maxLines: 12,
                              minLines: 1,
                              label:
                                  AppHelpers.getTranslation(TrKeys.description),
                              textInputAction: TextInputAction.next,
                              textController: desc,
                            ),
                            16.verticalSpace,
                            UnderlinedTextField(
                              readOnly: true,
                              onTap: () {
                                AppHelpers.showCustomModalBottomSheet(
                                  context: context,
                                  modal: ModalWrap(
                                    body: ServiceCategoriesModal(
                                      onChange: (value) {
                                        selectCategory = value;
                                        category.text =
                                            value.translation?.title ?? '';
                                      },
                                    ),
                                  ),
                                );
                              },
                              label:
                                  "${AppHelpers.getTranslation(TrKeys.category)}*",
                              textInputAction: TextInputAction.next,
                              validator: AppValidators.emptyCheck,
                              textController: category,
                            ),
                            16.verticalSpace,
                            UnderlinedTextField(
                              label:
                                  '${AppHelpers.getTranslation(TrKeys.interval)}*',
                              textInputAction: TextInputAction.next,
                              textController: interval,
                              inputType: TextInputType.number,
                              validator: AppValidators.isNumberValidator,
                              inputFormatters: [InputFormatter.digitsOnly],
                            ),
                            16.verticalSpace,
                            UnderlinedTextField(
                              label:
                                  '${AppHelpers.getTranslation(TrKeys.pause)}*',
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.number,
                              textController: pause,
                              validator: AppValidators.isNumberValidator,
                              inputFormatters: [InputFormatter.digitsOnly],
                            ),
                            16.verticalSpace,
                            UnderlinedTextField(
                              label: AppHelpers.getPriceLabel,
                              textInputAction: TextInputAction.next,
                              textController: price,
                              inputType: TextInputType.number,
                              validator: AppValidators.emptyCheck,
                              inputFormatters: [InputFormatter.currency],
                            ),
                            16.verticalSpace,
                            UnderlineDropDown(
                              label: TrKeys.type,
                              list: DropDownValues.serviceTypeList,
                              onChanged: notifier.setType,
                              value: state.serviceData?.type,
                            ),
                            16.verticalSpace,
                            UnderlineDropDown(
                              label: TrKeys.gender,
                              list: DropDownValues.genderList,
                              onChanged: notifier.setGender,
                              value: state.serviceData?.gender,
                            ),
                            48.verticalSpace,
                            CustomButton(
                              textColor: Style.white,
                              radius: 45,
                              title: AppHelpers.getTranslation(TrKeys.save),
                              isLoading: state.isUpdating,
                              onPressed: () {
                                // if (state.imageFile?.isEmpty ?? true) {
                                //   AppHelpers.errorSnackBar(context, text: TrKeys.imageCantEmpty);
                                // return;
                                // }
                                if ((_formKey.currentState?.validate() ??
                                        false) &&
                                    selectCategory?.id != null) {
                                  notifier.updateService(
                                    context,
                                    updated: (service) {
                                      AppHelpers.successSnackBar(
                                        context,
                                        text: AppHelpers.getTranslation(
                                            TrKeys.successfullyUpdated),
                                      );
                                      ref
                                          .read(serviceProvider.notifier)
                                          .fetchAllServices(
                                              context: context,
                                              isRefresh: true);
                                      context.popRoute();
                                    },
                                    title: title.text,
                                    description: desc.text,
                                    price: price.text,
                                    interval: interval.text,
                                    pause: pause.text,
                                    categoryId: selectCategory!.id!,
                                  );
                                }
                              },
                            ),
                            60.verticalSpace,
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
