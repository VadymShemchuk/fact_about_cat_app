import 'package:fact_about_cat/bloc/splash_bloc/splash_event.dart';
import 'package:fact_about_cat/bloc/splash_bloc/splash_state.dart';
import 'package:fact_about_cat/common/api_repository/api_repository.dart';
import 'package:fact_about_cat/common/hive_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this._apiRepository,
    this._hiveRepository,
  ) : super(
          LoadingSplashState(),
        ) {
    on<FatchDataFromApi>(fatchData);
  }

  final ApiRepository _apiRepository;
  final HiveRepository _hiveRepository;

  void fatchData(
    FatchDataFromApi event,
    Emitter<SplashState> emit,
  ) async {
    emit(LoadingSplashState());
    try {
      final listModel = _hiveRepository.readData();

      if (listModel.isNotEmpty) {
        emit(SuccessSplashState());
      } else {
        final model = await _apiRepository.fetchFactModel();
        _hiveRepository.writeData(model);
        emit(SuccessSplashState());
      }
    } on ApiRepositoryFailExeption catch (e) {
      emit(FailureSplashState(error: e.message));
    }
  }
}
