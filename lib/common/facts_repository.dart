import 'package:fact_about_cat/common/fact_model.dart';

class FactsRepository {
  List<FactModel> factModelList = [];

  void addNewFact(FactModel fact) {
    factModelList.add(fact);
  }
}
