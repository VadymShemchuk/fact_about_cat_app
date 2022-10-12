import 'package:fact_about_cat/bloc/loading_status.dart';

class FactState {
  final String imageUrl;
  final String catsFact;
  final String date;
  LoadingStatus status;

  FactState({
    this.imageUrl = '',
    this.catsFact = '',
    this.date = '',
    this.status = const Loading(),
  });

  FactState copyWith({
    String? imageUrl,
    String? catsFact,
    String? date,
    LoadingStatus? status,
  }) {
    return FactState(
      imageUrl: imageUrl ?? this.imageUrl,
      catsFact: catsFact ?? this.catsFact,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }
}
