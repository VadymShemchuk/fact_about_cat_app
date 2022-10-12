import 'package:fact_about_cat/bloc/loading_status.dart';
import 'package:fact_about_cat/common/fact_model.dart';

class FactsListState {
  List<FactModel> viewModel;
  LoadingStatus status;

  FactsListState({
    this.viewModel = const [],
    this.status = const Loading(),
  });

  FactsListState copyWith({
    List<FactModel>? viewModel,
    LoadingStatus? status,
  }) {
    return FactsListState(
      viewModel: viewModel ?? this.viewModel,
      status: status ?? this.status,
    );
  }
}
