import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_event.dart';
import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_state.dart';
import 'package:fact_about_cat/bloc/loading_status.dart';
import 'package:fact_about_cat/bloc/navigator_status.dart';
import 'package:fact_about_cat/common/hive_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactsListBloc extends Bloc<FactsListEvent, FactsListState> {
  FactsListBloc(
    this._hiveRepository,
  ) : super(FactsListState()) {
    on<GetLoadedFacts>(getFacts);
    on<DeleteFact>(deleteFact);
    on<OnFactView>(onFactView);
  }

  final HiveRepository _hiveRepository;

  void getFacts(
    GetLoadedFacts event,
    Emitter<FactsListState> emit,
  ) {
    final model = _hiveRepository.readData();
    emit(
      state.copyWith(
        newViewModel: model,
        itemCount: model.length,
        loadingStatus: Loaded(),
      ),
    );
  }

  void deleteFact(
    DeleteFact event,
    Emitter<FactsListState> emit,
  ) {
    _hiveRepository.deleteData();
    emit(state.copyWith(
      newViewModel: _hiveRepository.readData(),
    ));
  }

  void onFactView(
    OnFactView event,
    Emitter<FactsListState> emit,
  ) {
    emit(
      state.copyWith(
        navigatorStatus: OnDetailedFact(),
      ),
    );
  }
}
