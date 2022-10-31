import 'package:fact_about_cat/common/fact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveRepository {
  HiveRepository() : super();
  final _box = Hive.box<CatsFactModel>('factModel');

  void writeData(CatsFactModel model) async {
    _box.add(model);
  }

  List<CatsFactModel> readData() {
    final model = _box.values.toList();
    return model;
  }

  void deleteData() {
    _box.deleteAt(0);
  }
}
