import 'package:dio/dio.dart';
import 'package:fact_about_cat/api_repository/api_service_fact/api_service_fact.dart';
import 'package:fact_about_cat/api_repository/api_service_image/api_service_image.dart';
import 'package:fact_about_cat/common/cat_fact_model.dart';

class ApiRepository {
  final ApiServiceFact _apiServiceFact = ApiServiceFact(Dio());
  final ApiServiceImage _apiServiceImage = ApiServiceImage(Dio());

  void getCatsFact() async {
    final factResponse = await _apiServiceFact.getFact();
    final imageResponse = await _apiServiceImage.getImage();

    CatFactModel(
      catsFact: factResponse.catsFact,
      imageUrl: imageResponse.imageUrl,
    );
  }
}
