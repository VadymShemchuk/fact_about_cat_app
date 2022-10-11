import 'package:fact_about_cat/api_repository/api_repository.dart';
import 'package:fact_about_cat/bloc/splash_bloc/splash_event.dart';
import 'package:fact_about_cat/bloc/splash_bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this._apiRepository,
  ) : super(
          LoadingSplashState(),
        ) {
    on<FatchDataFromApi>(fatchData);
  }

  final ApiRepository _apiRepository;

  void fatchData(
    FatchDataFromApi event,
    Emitter<SplashState> emit,
  ) {
    _apiRepository.getCatsFact();
  }
}
