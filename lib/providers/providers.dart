import 'package:fact_about_cat/common/api_repository/api_repository.dart';
import 'package:fact_about_cat/common/fact_model.dart';
import 'package:fact_about_cat/common/hive_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider<CatFactModel>(create: (_) => CatFactModel()),
  Provider<HiveRepository>(create: (_) => HiveRepository()),
  ProxyProvider<CatFactModel, ApiRepository>(
      update: (
    _,
    factModel,
    apiRepository,
  ) =>
          ApiRepository(factModel)),
];
