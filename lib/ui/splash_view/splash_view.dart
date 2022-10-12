import 'package:fact_about_cat/bloc/splash_bloc/splash_bloc.dart';
import 'package:fact_about_cat/bloc/splash_bloc/splash_event.dart';
import 'package:fact_about_cat/bloc/splash_bloc/splash_state.dart';
import 'package:fact_about_cat/utils/button_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView(
    this.state, {
    super.key,
  });

  final SplashState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/cat.png'),
          ),
          if (state is LoadingSplashState)
            const Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
              child: Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          if (state is FailureSplashState)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                40,
                16,
                40,
                0,
              ),
              child: ButtonUtil.buildCommonButton(
                context,
                onPressed: () => context.read<SplashBloc>().add(
                      FatchDataFromApi(),
                    ),
                buttonText: 'Try again',
              ),
            ),
        ],
      ),
    );
  }
}
