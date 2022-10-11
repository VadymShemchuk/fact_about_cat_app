import 'package:fact_about_cat/providers/providers.dart';
import 'package:fact_about_cat/ui/random_fact_view/fact_module.dart';
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
          RandomFactModule.route: (_) => const RandomFactModule(),
        },
      ),
    );
  }
}
