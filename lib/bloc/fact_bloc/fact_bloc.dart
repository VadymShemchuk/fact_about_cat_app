import 'package:fact_about_cat/bloc/fact_bloc/fact_event.dart';
import 'package:fact_about_cat/bloc/fact_bloc/fact_state.dart';
import 'package:fact_about_cat/bloc/loading_status.dart';
import 'package:fact_about_cat/bloc/navigator_status.dart';
import 'package:fact_about_cat/common/api_repository/api_repository.dart';
import 'package:fact_about_cat/common/hive_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  FactBloc(
    this._apiRepository,
    this._hiveRepository,
  ) : super(FactState()) {
    on<GetLoadedFact>(getLoadedFact);
    on<FatchNewFact>(fatchNewFact);
    on<OnListFactsView>(onListFactsView);
  }

  final ApiRepository _apiRepository;
  final HiveRepository _hiveRepository;

  void getLoadedFact(
    GetLoadedFact event,
    Emitter<FactState> emit,
  ) {
    final modelList = _hiveRepository.readData();
    final modelItem = modelList.last;
    emit(state.copyWith(
      imageUrl: modelItem.imageUrl,
      catsFact: modelItem.catsFact,
      date: modelItem.date,
      loadingStatus: Loaded(),
    ));
  }

  void fatchNewFact(
    FatchNewFact event,
    Emitter<FactState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingStatus: const Loading(),
      ),
    );
    final model = await _apiRepository.fetchFactModel();
    final String imageUrl = model.imageUrl!;
    final String catsFact = model.catsFact!;
    final String date = model.date!;

    _hiveRepository.writeData(model);

    emit(state.copyWith(
      imageUrl: imageUrl,
      catsFact: catsFact,
      date: date,
      loadingStatus: Loaded(),
    ));
  }

  void onListFactsView(
    OnListFactsView event,
    Emitter<FactState> emit,
  ) {
    emit(
      state.copyWith(
        navigatorStatus: OnListFacts(),
      ),
    );
    emit(
      state.copyWith(
        navigatorStatus: const InitialNavigatorStatus(),
      ),
    );
  }
}
