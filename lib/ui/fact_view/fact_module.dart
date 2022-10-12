import 'package:fact_about_cat/bloc/fact_bloc/fact_bloc.dart';
import 'package:fact_about_cat/bloc/fact_bloc/fact_event.dart';
import 'package:fact_about_cat/bloc/fact_bloc/fact_state.dart';
import 'package:fact_about_cat/ui/fact_view/fact_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactModule extends StatelessWidget {
  const FactModule({super.key});

  static const route = '/randomFact';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FactBloc(
        context.read(),
        context.read(),
      )..add(GetLoadedFact()),
      child: BlocConsumer<FactBloc, FactState>(
        listener: (context, state) {},
        builder: (context, state) {
          return FactView(state);
        },
      ),
    );
  }
}
