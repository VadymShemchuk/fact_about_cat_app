import 'package:fact_about_cat/bloc/loading_status.dart';
import 'package:fact_about_cat/bloc/navigator_status.dart';

class FactState {
  final String imageUrl;
  final String catsFact;
  final String date;
  LoadingStatus loadingStatus;
  NavigatorStatus navigatorStatus;

  FactState({
    this.imageUrl = '',
    this.catsFact = '',
    this.date = '',
    this.loadingStatus = const Loading(),
    this.navigatorStatus = const InitialNavigatorStatus(),
  });

  FactState copyWith({
    String? imageUrl,
    String? catsFact,
    String? date,
    LoadingStatus? loadingStatus,
    NavigatorStatus? navigatorStatus,
  }) {
    return FactState(
      imageUrl: imageUrl ?? this.imageUrl,
      catsFact: catsFact ?? this.catsFact,
      date: date ?? this.date,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      navigatorStatus: navigatorStatus ?? this.navigatorStatus,
    );
  }
}
