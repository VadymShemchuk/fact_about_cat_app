import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FactCatResponse {
  @JsonKey(
    name: 'fact',
  )
  final String catsFact;

  @JsonKey(
    name: 'length',
  )
  final int factLength;

  FactCatResponse(
    this.catsFact,
    this.factLength,
  );
}
