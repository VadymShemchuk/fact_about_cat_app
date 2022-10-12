import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_bloc.dart';
import 'package:fact_about_cat/providers/providers.dart';
import 'package:fact_about_cat/ui/fact_view/fact_module.dart';
import 'package:fact_about_cat/ui/facts_list_view/facts_list_module.dart';
import 'package:fact_about_cat/ui/splash_view/splash_module.dart';
import 'package:fact_about_cat/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: AppTheme.makeTheme(),
        initialRoute: SplashModule.route,
        routes: {
          SplashModule.route: (_) => const SplashModule(),
          FactModule.route: (_) => const FactModule(),
          FactsListModule.route: (_) => const FactsListModule(),
        },
      ),
    );
  }
}
