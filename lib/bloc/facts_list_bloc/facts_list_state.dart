import 'package:fact_about_cat/bloc/loading_status.dart';
import 'package:fact_about_cat/bloc/navigator_status.dart';
import 'package:fact_about_cat/common/fact_model.dart';

class FactsListState {
  List<FactModel>? viewModel;
  LoadingStatus loadingStatus;
  NavigatorStatus navigatorStatus;
  int? itemsCount;

  FactsListState({
    this.itemsCount,
    this.viewModel,
    this.loadingStatus = const Loading(),
    this.navigatorStatus = const InitialNavigatorStatus(),
  });

  FactsListState copyWith({
    List<FactModel>? newViewModel,
    LoadingStatus? loadingStatus,
    NavigatorStatus? navigatorStatus,
    int? itemCount,
  }) {
    return FactsListState(
      itemsCount: itemsCount,
      viewModel: newViewModel ?? viewModel,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      navigatorStatus: navigatorStatus ?? this.navigatorStatus,
    );
  }
}
