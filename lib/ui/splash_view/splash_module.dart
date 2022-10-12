import 'package:fact_about_cat/bloc/splash_bloc/splash_bloc.dart';
import 'package:fact_about_cat/bloc/splash_bloc/splash_event.dart';
import 'package:fact_about_cat/bloc/splash_bloc/splash_state.dart';
import 'package:fact_about_cat/ui/fact_view/fact_module.dart';
import 'package:fact_about_cat/ui/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashModule extends StatelessWidget {
  const SplashModule({super.key});

  static const route = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashBloc(
          context.read(),
          context.read(),
        )..add(FatchDataFromApi()),
        child: BlocConsumer<SplashBloc, SplashState>(
          listenWhen: ((previous, current) => previous is! FailureSplashState),
          listener: (_, state) {
            if (state is SuccessSplashState) {
              Navigator.of(context).pushReplacementNamed(FactModule.route);
            } else if (state is FailureSplashState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Something went wrong, try again.'),
                  ),
                );
            }
          },
          builder: (_, state) {
            return SplashView(
              state,
            );
          },
        ),
      ),
    );
  }
}
