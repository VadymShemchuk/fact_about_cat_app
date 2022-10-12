import 'package:fact_about_cat/api_repository/api_repository.dart';
import 'package:fact_about_cat/bloc/splash_bloc/splash_event.dart';
import 'package:fact_about_cat/bloc/splash_bloc/splash_state.dart';
import 'package:fact_about_cat/common/facts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this._apiRepository,
    this._factsRepository,
  ) : super(
          LoadingSplashState(),
        ) {
    on<FatchDataFromApi>(fatchData);
  }

  final ApiRepository _apiRepository;
  final FactsRepository _factsRepository;

  void fatchData(
    FatchDataFromApi event,
    Emitter<SplashState> emit,
  ) async {
    emit(LoadingSplashState());
    try {
      final model = await _apiRepository.fetchFactModel();
      _factsRepository.addNewFact(model);
      emit(SuccessSplashState());
    } on ApiRepositoryFailExeption catch (e) {
      emit(FailureSplashState(error: e.message));
    }
  }
}
