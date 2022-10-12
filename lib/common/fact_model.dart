import 'package:fact_about_cat/utils/random_date_generator.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'fact_model.g.dart';

@HiveType(typeId: 1)
class FactModel {
  @HiveField(0)
  final String? catsFact;

  @HiveField(1)
  String? date;

  @HiveField(2)
  final String? imageUrl;

  FactModel({
    this.catsFact,
    this.imageUrl,
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
