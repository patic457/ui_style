import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageConverter extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final Alignment alignment;
  final double? width;
  final double? height;

  const ImageConverter({
    Key? key,
    this.imageUrl,
    this.alignment = Alignment.center,
    this.fit,
    this.width,
    this.height,
  }) : super(key: key);

  bool _isValidURL(String url) {
    final uri = Uri.parse(url);
    if (uri.isScheme('HTTP') || uri.isScheme('HTTPS')) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || _isValidURL(imageUrl!)) {
      return Container(
        width: width,
        height: height,
        child: CachedNetworkImage(
          imageUrl: imageUrl!.toString(),
          fit: fit,
          alignment: alignment,
          progressIndicatorBuilder:
              (BuildContext context, url, downloadProgress) =>
                  CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
          errorWidget: (context, url, error) => Image.asset(
            "packages/ui_style/assets/image/icon_exclamation.png",
          ),
        ),
      );
    } else if (imageUrl == null || !_isValidURL(imageUrl!)) {
      return Container(
        width: width,
        height: height,
        child: Image.asset(
          imageUrl!,
          fit: fit,
          alignment: alignment,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            "packages/ui_style/assets/image/icon_exclamation.png",
          ),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        child: Image.asset("assets/image/icon_exclamation.png",
            fit: fit, alignment: alignment),
      );
    }
  }
}
