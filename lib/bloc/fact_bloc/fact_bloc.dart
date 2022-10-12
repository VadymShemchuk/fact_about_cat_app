import 'package:fact_about_cat/api_repository/api_repository.dart';
import 'package:fact_about_cat/bloc/fact_bloc/fact_event.dart';
import 'package:fact_about_cat/bloc/fact_bloc/fact_state.dart';
import 'package:fact_about_cat/bloc/loading_status.dart';
import 'package:fact_about_cat/common/facts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  FactBloc(
    this._apiRepository,
    this._factsRepository,
  ) : super(FactState()) {
    on<GetLoadedFact>(getLoadedFact);
    on<FatchNewFact>(fatchNewFact);
  }

  final ApiRepository _apiRepository;
  final FactsRepository _factsRepository;

  void getLoadedFact(
    GetLoadedFact event,
    Emitter<FactState> emit,
  ) {
    emit(state.copyWith(
      imageUrl: _factsRepository.factModelList.last.imageUrl,
      catsFact: _factsRepository.factModelList.last.catsFact,
      date: _factsRepository.factModelList.last.date,
      status: Loaded(),
    ));
  }

  void fatchNewFact(
    FatchNewFact event,
    Emitter<FactState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const Loading(),
      ),
    );
    final model = await _apiRepository.fetchFactModel();
    final String imageUrl = model.imageUrl;
    final String catsFact = model.catsFact;
    final String date = model.date!;

    _factsRepository.addNewFact(model);

    emit(state.copyWith(
      imageUrl: imageUrl,
      catsFact: catsFact,
      date: date,
      status: Loaded(),
    ));
  }
}
