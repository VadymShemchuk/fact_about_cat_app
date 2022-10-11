import 'package:fact_about_cat/bloc/splash_bloc/splash_bloc.dart';
import 'package:fact_about_cat/ui/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashModule extends StatelessWidget {
  const SplashModule({super.key});

  static const route = '/splash';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: const SplashView(),
    );
  }
}
