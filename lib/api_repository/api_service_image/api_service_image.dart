import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service_image.g.dart';

@RestApi(baseUrl: 'https://api.thecatapi.com/v1')
abstract class ApiServiceImage {
  factory ApiServiceImage(Dio dio, {String baseUrl}) = _ApiServiceImage;

  @GET('/images/search')
  Future<ImageResponse> getImage();
}

@JsonSerializable()
class ImageResponse {
  @JsonKey(name: 'id')
  final String imageId;
  @JsonKey(name: 'url')
  final String? imageUrl;
  @JsonKey(name: 'width')
  final int imageWidth;
  @JsonKey(name: 'height')
  final int imageHeight;

  ImageResponse({
    required this.imageId,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
}
