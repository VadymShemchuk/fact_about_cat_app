import 'package:fact_about_cat/api_repository/api_repository.dart';
import 'package:fact_about_cat/common/fact_model.dart';
import 'package:fact_about_cat/common/facts_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider<FactModel>(create: (_) => FactModel()),
  Provider<FactsRepository>(create: (_) => FactsRepository()),
  ProxyProvider<FactModel, ApiRepository>(
      update: (_, factModel, apiRepository) => ApiRepository(factModel)),
];
