import 'package:fact_about_cat/utils/random_date_generator.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'fact_model.g.dart';

@HiveType(typeId: 1)
class CatsFactModel {
  @HiveField(0)
  final String? catFact;

  @HiveField(1)
  String? date;

  @HiveField(2)
  final String? imageUrl;

  CatsFactModel({
    this.catFact,
    this.imageUrl,
    this.date,
  });

  CatsFactModel copyWith({
    String? catsFact,
    String? imageUrl,
  }) {
    final newDate = RandomDateUtil.generateRandomDate();
    return CatsFactModel(
      catFact: catsFact ?? this.catFact,
      imageUrl: imageUrl ?? this.imageUrl,
      date: newDate,
    );
  }
}
