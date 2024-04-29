import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import '../buttons/animation_button_effect.dart';
import '../video_page.dart';

class CommonImage extends StatelessWidget {
  final String? url;
  final File? fileImage;
  final double? width;
  final String? preview;
  final double? height;
  final double radius;
  final double errorRadius;
  final Color? errorBackground;
  final BoxFit? fit;
  final String? name;
  final String? title;
  final VoidCallback? onDelete;

  const CommonImage({
    super.key,
    this.url,
    this.width,
    this.height,
    this.radius = AppConstants.radius / 1.6,
    this.errorRadius = 10,
    this.errorBackground,
    this.fit,
    this.fileImage,
    this.preview,
    this.name,
    this.title,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius.r),
        child: preview != null
            ? Stack(
                children: [
                  CachedNetworkImage(
                    height: height?.r,
                    width: width?.r,
                    imageUrl: preview ?? "",
                    fit: fit,
                    progressIndicatorBuilder: (context, url, progress) {
                      return Container(
                        height: height?.r,
                        width: width?.r,
                        decoration: const BoxDecoration(
                          color: Style.shimmerBase,
                        ),
                        child: (width ?? 0) > 58
                            ? Center(
                                child: Text(
                                  AppHelpers.getTranslation(
                                      AppHelpers.getAppName()),
                                  style: Style.interNormal(
                                      color: Style.textHint, size: 12),
                                ),
                              )
                            : const SizedBox.shrink(),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius.r),
                          color:
                              name == null ? Style.shimmerBase : Style.primary,
                        ),
                        alignment: Alignment.center,
                        child: name == null
                            ? const Icon(FlutterRemix.file_unknow_line)
                            : Text(
                                name?.substring(0, 1) ?? "",
                                style: Style.interNormal(
                                  color: Style.white,
                                  size: (height ?? 0) / 2.5,
                                ),
                              ),
                      );
                    },
                  ),
                  Positioned.fill(
                    child: Center(
                      child: ButtonEffectAnimation(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPage(
                                        url: url,
                                        onDelete: onDelete,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                              color: Style.white.withOpacity(0.8),
                              shape: BoxShape.circle),
                          child: const Icon(
                            FlutterRemix.play_fill,
                            color: Style.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : fileImage != null
                ? Image.file(
                    fileImage!,
                    height: height,
                    width: width,
                    fit: fit,
                  )
                : AppHelpers.checkIsSvg(url)
                    ? SvgPicture.network(
                        '$url',
                        width: width?.r,
                        height: height?.r,
                        fit: BoxFit.cover,
                        placeholderBuilder: (_) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius.r),
                            color: Style.white,
                          ),
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: '$url',
                        width: width?.r,
                        height: height?.r,
                        fit: fit ?? BoxFit.cover,
                        progressIndicatorBuilder: (_, __, ___) => Container(
                          height: height?.r,
                          width: width?.r,
                          decoration: const BoxDecoration(
                            color: Style.shimmerBase,
                          ),
                          child: (width ?? 0) > 58
                              ? Center(
                                  child: Text(
                                    AppHelpers.getTranslation(
                                        AppHelpers.getAppName()),
                                    style: Style.interNormal(
                                        color: Style.textHint, size: 12),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                        errorWidget: (_, __, ___) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(errorRadius.r),
                            color: errorBackground ?? Style.greyColor,
                          ),
                          alignment: Alignment.center,
                          child: title?.isNotEmpty ?? false
                              ? Text(title!)
                              : Icon(
                                  FlutterRemix.image_line,
                                  color: Style.black.withOpacity(0.5),
                                  size: 20.r,
                                ),
                        ),
                      ));
  }
}
