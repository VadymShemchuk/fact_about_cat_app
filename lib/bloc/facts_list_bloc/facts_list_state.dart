import 'package:fact_about_cat/bloc/loading_status.dart';
import 'package:fact_about_cat/bloc/navigator_status.dart';
import 'package:fact_about_cat/common/fact_model.dart';

class FactsListState {
  List<FactModel> viewModel;
  LoadingStatus loadingStatus;
  NavigatorStatus navigatorStatus;
  int get itemsCount => viewModel.length;

  FactsListState({
    this.viewModel = const [],
    this.loadingStatus = const Loading(),
    this.navigatorStatus = const InitialNavigatorStatus(),
  });

  FactsListState copyWith({
    List<FactModel>? viewModel,
    LoadingStatus? loadingStatus,
    NavigatorStatus? navigatorStatus,
  }) {
    return FactsListState(
      viewModel: viewModel ?? this.viewModel,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      navigatorStatus: navigatorStatus ?? this.navigatorStatus,
    );
  }
}
