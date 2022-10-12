import 'package:fact_about_cat/utils/random_date_generator.dart';

class FactModel {
  final String catsFact;
  final String imageUrl;
  String? date;

  FactModel({
    this.catsFact = '',
    this.imageUrl = '',
    this.date,
  });

  FactModel copyWith({
    String? catsFact,
    String? imageUrl,
  }) {
    final newDate = RandomDateUtil.generateRandomDate();
    return FactModel(
      catsFact: catsFact ?? this.catsFact,
      imageUrl: imageUrl ?? this.imageUrl,
      date: newDate,
    );
  }
}
