import 'package:dio/dio.dart';
import 'package:fact_about_cat/common/api_repository/api_service_fact/api_service_fact.dart';
import 'package:fact_about_cat/common/api_repository/api_service_image/api_service_image.dart';
import 'package:fact_about_cat/common/fact_model.dart';

class ApiRepository {
  final ApiServiceFact _apiServiceFact = ApiServiceFact(Dio());
  final ApiServiceImage _apiServiceImage = ApiServiceImage(Dio());
  final CatFactModel _factModel;

  ApiRepository(
    this._factModel,
  );

  Future<CatFactModel> fetchFactModel() async {
    try {
      final factResponse = await _apiServiceFact.getFact();
      final imageResponse = await _apiServiceImage.getImage();
      return _factModel.copyWith(
        catsFact: factResponse.catsFact,
        imageUrl: imageResponse.first.imageUrl,
      );
    } on DioError catch (e) {
      throw ApiRepositoryFailExeption.copyWith(e.message);
    } catch (_) {
      throw ApiRepositoryFailExeption();
    }
  }
}

class ApiRepositoryFailExeption implements Exception {
  final String? message;

  ApiRepositoryFailExeption([this.message = 'An unknown exception occurred.']);

  factory ApiRepositoryFailExeption.copyWith(String? message) {
    return ApiRepositoryFailExeption(message);
  }
}
