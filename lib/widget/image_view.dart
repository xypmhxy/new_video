import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/widget/image_placeholder_view.dart';

class AutoImageView extends StatelessWidget {
  final String? imageUrl;
  final Uint8List? imageData;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Map<String, String>? httpHeaders;
  final LoadingErrorWidgetBuilder? errorBuilder;
  final PlaceholderWidgetBuilder? placeholderBuilder;

  const AutoImageView(
      {super.key,
      this.imageUrl,
      this.imageData,
      this.size,
      this.width,
      this.height,
      this.fit,
      this.httpHeaders,
      this.errorBuilder,
      this.placeholderBuilder});

  @override
  Widget build(BuildContext context) {
    if (imageData?.isNotEmpty ?? false) {
      return ImageView.memory(
        imageData: imageData!,
        size: size,
        width: width,
        height: height,
        fit: fit,
      );
    } else if (imageUrl?.startsWith('http') ?? false) {
      return ImageView.network(
        imageUrl: imageUrl!,
        size: size,
        width: width,
        height: height,
        fit: fit,
        httpHeaders: httpHeaders,
        errorBuilder: errorBuilder,
        placeholderBuilder: placeholderBuilder,
      );
    } else if (imageUrl?.startsWith('asset') ?? false) {
      return ImageView.asset(
        imageUrl!,
        size: size,
        width: width,
        height: height,
        fit: fit,
      );
    }
    return ImageView.file(
      file: File(imageUrl!),
      size: size,
      width: width,
      height: height,
      fit: fit,
    );
  }
}

class ImageView extends StatelessWidget {
  final Widget imageChild;

  const ImageView({Key? key, required this.imageChild}) : super(key: key);

  factory ImageView.asset(String assets, {double? size, double? width, double? height, BoxFit? fit}) = _AssetsImageView;

  factory ImageView.file({File? file, String? filePath, double? size, double? width, double? height, BoxFit? fit}) =
      _FileImageView;

  factory ImageView.memory({required Uint8List imageData, double? size, double? width, double? height, BoxFit? fit}) =
      _ByteImageView;

  factory ImageView.network(
      {required String imageUrl,
      double? size,
      double? width,
      double? height,
      BoxFit? fit,
      Map<String, String>? httpHeaders,
      double? placeholderIconSize,
      LoadingErrorWidgetBuilder? errorBuilder,
      PlaceholderWidgetBuilder? placeholderBuilder}) = _NetworkImageView;

  @override
  Widget build(BuildContext context) {
    return imageChild;
  }
}

class _AssetsImageView extends ImageView {
  final String assets;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? fit;

  _AssetsImageView(this.assets, {this.size, this.width, this.height, this.fit})
      : super(
            imageChild: Image.asset(
          assets,
          width: size ?? width,
          height: size ?? height,
          fit: fit ?? BoxFit.cover,
        ));
}

class _FileImageView extends ImageView {
  final File? file;
  final String? filePath;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? fit;

  _FileImageView({this.file, this.filePath, this.size, this.width, this.height, this.fit})
      : assert(file != null || filePath != null),
        super(
            imageChild: Image.file(
          file ?? File(filePath!),
          width: size ?? width,
          height: size ?? height,
          fit: fit ?? BoxFit.cover,
        ));
}

class _ByteImageView extends ImageView {
  final Uint8List imageData;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? fit;

  _ByteImageView({required this.imageData, this.size, this.width, this.height, this.fit})
      : super(
            imageChild: Image.memory(
          imageData,
          width: size ?? width,
          height: size ?? height,
          fit: fit ?? BoxFit.cover,
        ));
}

class _NetworkImageView extends ImageView {
  final String imageUrl;
  final double? size;
  final double? width;
  final double? height;
  final double? placeholderIconSize;
  final BoxFit? fit;
  final Map<String, String>? httpHeaders;
  final LoadingErrorWidgetBuilder? errorBuilder;
  final PlaceholderWidgetBuilder? placeholderBuilder;

  _NetworkImageView(
      {required this.imageUrl,
      this.size,
      this.width,
      this.height,
      this.placeholderIconSize,
      this.fit,
      this.httpHeaders,
      this.errorBuilder,
      this.placeholderBuilder})
      : super(
            imageChild: CachedNetworkImage(
          imageUrl: imageUrl,
          httpHeaders: httpHeaders,
          width: size ?? width,
          height: size ?? height,
          fit: fit ?? BoxFit.cover,
          errorWidget: errorBuilder ??
              (_, __, ___) {
                return ImagePlaceHolderView(
                    iconSize: placeholderIconSize ?? 48.0, width: size ?? width, height: size ?? height);
              },
          placeholder: placeholderBuilder ??
              (_, __) {
                return ImagePlaceHolderView(
                    iconSize: placeholderIconSize ?? 48.0, width: size ?? width, height: size ?? height);
              },
        ));
}
