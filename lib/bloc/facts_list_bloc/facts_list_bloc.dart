import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_event.dart';
import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_state.dart';
import 'package:fact_about_cat/bloc/loading_status.dart';
import 'package:fact_about_cat/bloc/navigator_status.dart';
import 'package:fact_about_cat/common/facts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactsListBloc extends Bloc<FactsListEvent, FactsListState> {
  FactsListBloc(this._factsRepository) : super(FactsListState()) {
    on<GetLoadedFacts>(getFacts);
    on<DeleteFact>(deleteFact);
    on<OnFactView>(onFactView);
  }

  final FactsRepository _factsRepository;

  void getFacts(
    GetLoadedFacts event,
    Emitter<FactsListState> emit,
  ) {
    emit(
      state.copyWith(
        viewModel: _factsRepository.factModelList,
        loadingStatus: Loaded(),
      ),
    );
  }

  void deleteFact(
    DeleteFact event,
    Emitter<FactsListState> emit,
  ) {
    _factsRepository.factModelList.removeAt(event.factIndex);
    emit(state.copyWith(
      viewModel: _factsRepository.factModelList,
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
