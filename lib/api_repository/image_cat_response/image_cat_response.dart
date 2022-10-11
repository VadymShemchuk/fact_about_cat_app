import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ImageCatResponse {
  @JsonKey(name: 'id')
  final String imageId;

  @JsonKey(name: 'url')
  final String imageUrl;

  @JsonKey(name: 'width')
  final int imageWidth;

  @JsonKey(name: 'height')
  final int imageHeight;

  ImageCatResponse(
    this.imageId,
    this.imageUrl,
    this.imageWidth,
    this.imageHeight,
  );
}
