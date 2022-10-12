import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_bloc.dart';
import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_event.dart';
import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_state.dart';
import 'package:fact_about_cat/bloc/navigator_status.dart';
import 'package:fact_about_cat/ui/facts_list_view/facts_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactsListModule extends StatelessWidget {
  const FactsListModule({super.key});

  static const route = '/factlist';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FactsListBloc(
        context.read(),
      )..add(GetLoadedFacts()),
      child: BlocConsumer<FactsListBloc, FactsListState>(
        listener: (context, state) {
          if (state.navigatorStatus is OnDetailedFact) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return FactsListView(state);
        },
      ),
    );
  }
}
