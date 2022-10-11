import 'package:fact_about_cat/api_repository/api_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider<ApiRepository>(create: (_) => ApiRepository()),
];
