import 'package:image_collage/src/models/image_source.dart';

/// image object: contains the image path/URL & the source type
class Img {
  const Img({
    required this.image,
    this.source = ImageSource.network,
  });
  /// the link or the path of the image
  final String image;
  /// source could be either network, assets, memory
  final ImageSource source;
}
