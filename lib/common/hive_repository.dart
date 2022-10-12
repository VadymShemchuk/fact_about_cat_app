import 'package:fact_about_cat/common/fact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveRepository {
  HiveRepository() : super();
  final _box = Hive.box<FactModel>('factModel');

  void writeData(FactModel model) async {
    _box.add(model);
  }

  List<FactModel> readData() {
    final model = _box.values.toList();
    return model;
  }

  void deleteData() {
    final model = _box.values.toList();
    final int index = model.indexOf(model.first);
    _box.deleteAt(index);
  }
}
