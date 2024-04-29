import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/application/providers.dart';

class CreateProductGalleryBody extends ConsumerStatefulWidget {
  const CreateProductGalleryBody({super.key});

  @override
  ConsumerState<CreateProductGalleryBody> createState() =>
      _EditProductGalleryBodyState();
}

class _EditProductGalleryBodyState
    extends ConsumerState<CreateProductGalleryBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(createProductGalleryProvider.notifier)
          .initial(ref.read(createFoodDetailsProvider).createdProduct?.stocks);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createProductGalleryProvider);
    final notifier = ref.read(createProductGalleryProvider.notifier);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              padding: REdgeInsets.symmetric(vertical: 16),
              itemCount: state.extras.length,
              itemBuilder: (context, index) {
                final key = state.extras[index].stockId.toString();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          REdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          ColorItem(
                            extras: (state.extras[index]),
                            size: 24,
                          ),
                          6.horizontalSpace,
                          Text(
                            "(${state.extras[index].value ?? " "})",
                            style: Style.interNormal(),
                          ),
                        ],
                      ),
                    ),
                    MultiImagePicker(
                      isExtras: true,
                      onDelete: (p) => notifier.deleteImage(path: p, key: key),
                      imageUrls: state.listOfUrls[key],
                      listOfImages: state.images[key],
                      onImageChange: (p) =>
                          notifier.setImageFile(path: p, key: key),
                    ),
                  ],
                );
              }),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
            title: AppHelpers.getTranslation(TrKeys.save),
            isLoading: state.isSaving,
            onPressed: () {
              notifier.updateGallery(context, updated: () {
                context.popRoute();
              });
            },
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}
