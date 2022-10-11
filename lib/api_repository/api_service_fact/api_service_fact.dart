import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_service_fact.g.dart';

@RestApi(baseUrl: 'https://catfact.ninja')
abstract class ApiServiceFact {
  factory ApiServiceFact(Dio dio, {String baseUrl}) = _ApiServiceFact;

  @GET('/fact')
  Future<FactResponse> getFact();
}

@JsonSerializable()
class FactResponse {
  @JsonKey(name: 'fact')
  final String catsFact;
  @JsonKey(name: 'length')
  final int factLength;

  FactResponse({
    required this.catsFact,
    required this.factLength,
  });

  factory FactResponse.fromJson(Map<String, dynamic> json) =>
      _$FactResponseFromJson(json);
}
