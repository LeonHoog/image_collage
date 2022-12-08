import 'package:flutter/material.dart';
import 'package:image_collage/src/extensions/expand_equally.dart';
import 'package:image_collage/src/models/image.dart';
import 'package:image_collage/src/models/image_layout.dart';
import 'package:image_collage/src/widgets/show_image.dart';

class ImageCollage extends StatefulWidget {
  const ImageCollage({
    Key? key,
    this.images,
    this.heroTag,
    required this.onClick,
    this.widthSize = 0,
    this.noImageText = "Unable to load",
    this.showMoreBackgroundColor = Colors.black,
    this.showMoreBackgroundOpacity = 0.5,
    this.noImageTextStyle = const TextStyle(
        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26),
    this.showMore = "",
    this.showMoreTextStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 36),
    this.noImageBackgroundColor = Colors.white,
    this.margin = const EdgeInsets.all(0),
  })  : assert(showMoreBackgroundOpacity <= 1),
        super(key: key);

  /// list of the images
  final List<Img>? images;
  /// hero tag for image
  final Object? heroTag;
  /// onClick on the image it gives the clicked image & the list of the images
  final Function(Img?, List<Img>?)? onClick;
  /// margins that apply for the container that holds the images
  final EdgeInsets margin;
  /// by default will get width size
  final double widthSize;
  /// show more string that will be shown when there is more than 3 images
  /// default: +(how much)
  final String showMore;
  /// background color of the last image which will be as a filter
  final Color showMoreBackgroundColor;
  /// background opacity of the last iamge
  final double showMoreBackgroundOpacity;
  /// show more textStyle
  final TextStyle showMoreTextStyle;
  /// if no image found in the list, it will show this text
  final String noImageText;
  /// no images textStyle
  final TextStyle noImageTextStyle;
  /// no image background color
  final Color noImageBackgroundColor;

  @override
  State<ImageCollage> createState() => ImageCollageState();
}

late double size;

class ImageCollageState extends State<ImageCollage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.widthSize == 0) {
      size = MediaQuery.of(context).size.width - widget.margin.left - widget.margin.right;
    } else {
      size = widget.widthSize;
    }
    return SizedBox(
      height: size,
      width: size,
      child: _buildLayout(context),
    );
  }

  Widget _buildLayout(context) {
    switch (widget.images?.length) {
      case 0: //no images provided
        return ShowImage(
          callBack: (Img) => widget.onClick!(null,null),
          layout: ImageLayout.full,
          margin: widget.margin,
          noImageBackgroundColor: widget.noImageBackgroundColor,
          noImageText: widget.noImageText,
          width: widget.widthSize,
        );
      case 1: //1 image provided
        return ShowImage(
          image: widget.images!.first,
          heroTag: widget.heroTag,
          callBack: (image) => widget.onClick!(image!, widget.images!),
          layout: ImageLayout.full,
          margin: widget.margin,
          noImageBackgroundColor: widget.noImageBackgroundColor,
          noImageText: widget.noImageText,
          width: widget.widthSize,
        );
      case 2: //2 images provided
        return Row(
          children: [
            ShowImage(
              image: widget.images![0],
              heroTag: widget.heroTag,
              callBack: (image) => widget.onClick!(image!, widget.images!),
              layout: ImageLayout.half,
              margin: widget.margin,
              noImageBackgroundColor: widget.noImageBackgroundColor,
              noImageText: widget.noImageText,
              width: widget.widthSize,
            ),
            ShowImage(
              image: widget.images![1],
              heroTag: widget.heroTag,
              callBack: (image) => widget.onClick!(image!, widget.images!),
              layout: ImageLayout.half,
              margin: widget.margin,
              noImageBackgroundColor: widget.noImageBackgroundColor,
              noImageText: widget.noImageText,
              width: widget.widthSize,
            )
          ].expandEqually().toList(),
        );

      case 3: //3 images provided
        return Row(
          children: [
            ShowImage(
              image: widget.images![0],
              heroTag: widget.heroTag,
              callBack: (image) => widget.onClick!(image!, widget.images!),
              layout: ImageLayout.half,
              margin: widget.margin,
              noImageBackgroundColor: widget.noImageBackgroundColor,
              noImageText: widget.noImageText,
              width: widget.widthSize,
            ),
            Column(
              children: [
                ShowImage(
                  image: widget.images![1],
                  heroTag: widget.heroTag,
                  callBack: (image) => widget.onClick!(image!, widget.images!),
                  layout: ImageLayout.quarter,
                  margin: widget.margin,
                  noImageBackgroundColor: widget.noImageBackgroundColor,
                  noImageText: widget.noImageText,
                  width: widget.widthSize,
                ),
                ShowImage(
                  image: widget.images![2],
                  heroTag: widget.heroTag,
                  callBack: (image) => widget.onClick!(image!, widget.images!),
                  layout: ImageLayout.quarter,
                  margin: widget.margin,
                  noImageBackgroundColor: widget.noImageBackgroundColor,
                  noImageText: widget.noImageText,
                  width: widget.widthSize,
                ),
              ].expandEqually().toList(),
            )
          ].expandEqually().toList(),
        );
      default: //more than 3 images provided
        return Row(
          children: [
            ShowImage(
              image: widget.images![0],
              heroTag: widget.heroTag,
              callBack: (image) => widget.onClick!(image!, widget.images!),
              layout: ImageLayout.half,
              margin: widget.margin,
              noImageBackgroundColor: widget.noImageBackgroundColor,
              noImageText: widget.noImageText,
              width: widget.widthSize,
            ),
            Column(
              children: [
                ShowImage(
                  image: widget.images![1],
                  heroTag: widget.heroTag,
                  callBack: (image) => widget.onClick!(image!, widget.images!),
                  layout: ImageLayout.quarter,
                  margin: widget.margin,
                  noImageBackgroundColor: widget.noImageBackgroundColor,
                  noImageText: widget.noImageText,
                  width: widget.widthSize,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ShowImage(
                      image: widget.images![2],
                      heroTag: widget.heroTag,
                      callBack: (image) =>
                          widget.onClick!(image!, widget.images!),
                      layout: ImageLayout.quarter,
                      margin: widget.margin,
                      noImageBackgroundColor: widget.noImageBackgroundColor,
                      noImageText: widget.noImageText,
                      width: widget.widthSize,
                    ),
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () => widget.onClick!(widget.images![3], widget.images!),
                        child: ColoredBox(
                          color: widget.showMoreBackgroundColor
                              .withOpacity(widget.showMoreBackgroundOpacity),
                          child: Center(
                            child: Text(
                              widget.showMore != ""
                                  ? widget.showMore
                                  : '+${widget.images!.length - 3}',
                              style: widget.showMoreTextStyle,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ].expandEqually().toList(),
            )
          ].expandEqually().toList(),
        );
    }
  }
}
