import 'package:flutter/material.dart';
import 'package:image_collage/src/models/image.dart';
import 'package:image_collage/src/models/image_layout.dart';
import 'package:image_collage/src/models/image_source.dart';

/// Widget that renders each image
class ShowImage extends StatelessWidget {
  const ShowImage(
      {Key? key,
      this.image,
      this.heroTag,
      required this.margin,
      required this.width,
      this.noImageText,
      required this.noImageBackgroundColor,
      required this.callBack,
      required this.layout,
      this.isLast = false})
      : super(key: key);
  /// image object
  final Img? image;
  final Object? heroTag;
  /// layout:  full, half, quarter
  final ImageLayout layout;
  /// margin
  final EdgeInsets margin;
  /// no Image Background Color
  final Color noImageBackgroundColor;
  /// no Image Text
  final String? noImageText;
  /// width & height are linked to each other width = height = valueBelow
  final double width;
  /// call back with the image
  final Function(Img?) callBack;
  /// is last to show the showmore
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    late double size;
    if (width == 0) {
      size = MediaQuery.of(context).size.width - margin.left - margin.right;
    } else {
      size = width;
    }

    double imageHeight = (layout == ImageLayout.full)
        ? size
        : (layout == ImageLayout.half)
        ? size
        : size / 2;

    double imageWidth = (layout == ImageLayout.full)
        ? size
        : (layout == ImageLayout.half)
        ? size / 2
        : size / 2;

    late Widget imageWidget;
    switch (image?.source) {
      case ImageSource.assets:
        imageWidget = Image.asset(
          image!.image,
          height: imageHeight,
          width: imageWidth,
          fit: BoxFit.cover,
        );
        break;
      case ImageSource.network:
        imageWidget = Image.network(
          image!.image,
          height: imageHeight,
          width: imageWidth,
          fit: BoxFit.cover,
        );
        break;
      default:
        return GestureDetector(
          onTap: () => callBack(null),
          child: SizedBox(
            height: imageHeight,
            width: imageWidth,
            child: ColoredBox(
              color: noImageBackgroundColor,
              child: Center(
                  child: Text(
                    noImageText ?? "Unable to load",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            ),
          ),
        );
    }
    
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => callBack(image!),
      child: imageWidget,
    );
  }
}
