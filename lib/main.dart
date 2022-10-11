import 'package:fact_about_cat/ui/splash_view/splash_module.dart';
import 'package:fact_about_cat/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.makeTheme(),
      initialRoute: SplashModule.route,
      routes: {
        SplashModule.route: (context) => const SplashModule(),
      },
    );
  }
}
