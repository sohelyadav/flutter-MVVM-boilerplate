import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_mvvm_boilerplate/utils/dummy.dart';

FadeInImage customNetworkImage(String url,
    {double? height,
    String? networkPlaceholder,
    double? width,
    BlendMode? colorBlendMode,
    BoxFit fit = BoxFit.cover,
    Alignment alignment = Alignment.center,
    String placeholder = "assets/images/placeholder.png"}) {
  precacheImage(CachedNetworkImageProvider(url),
      StackedService.navigatorKey!.currentContext!);
  Widget errorBuilder = networkPlaceholder == null
      ? Image.asset(
          placeholder,
          fit: fit,
          width: width,
          height: height,
        )
      : CachedNetworkImage(
          imageUrl: networkPlaceholder,
          fit: fit,
          width: width,
          height: height,
        );

  ImageProvider<Object> buildImage() {
    if (url.isEmpty) {
      if (networkPlaceholder?.isEmpty ?? true) {
        return AssetImage(placeholder);
      } else {
        return CachedNetworkImageProvider(
            networkPlaceholder ?? dummyNetworkImage,
            cacheManager: DefaultCacheManager());
      }
    } else {
      return CachedNetworkImageProvider(url,
          cacheManager: DefaultCacheManager(), cacheKey: url);
    }
  }

  return FadeInImage(
    fadeOutDuration: Duration(milliseconds: 200),
    alignment: alignment,
    placeholderErrorBuilder: (context, _, __) => errorBuilder,
    imageErrorBuilder: (context, _, __) {
      return errorBuilder;
    },
    height: height,
    width: width,
    placeholder: Image.asset(
      'assets/images/imageloading.gif',
    ).image,
    fit: fit,
    image: buildImage(),
  );
}
