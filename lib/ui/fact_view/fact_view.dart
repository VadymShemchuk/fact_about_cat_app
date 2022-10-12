import 'dart:math';
import 'package:fact_about_cat/bloc/fact_bloc/fact_bloc.dart';
import 'package:fact_about_cat/bloc/fact_bloc/fact_event.dart';
import 'package:fact_about_cat/bloc/fact_bloc/fact_state.dart';
import 'package:fact_about_cat/bloc/loading_status.dart';
import 'package:fact_about_cat/utils/button_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactView extends StatelessWidget {
  const FactView(
    this.state, {
    super.key,
  });

  final FactState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A fact about cat!'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => context.read<FactBloc>().add(OnListFactsView()),
              icon: Transform(
                  transform: Matrix4.rotationY(pi),
                  child: const Icon(Icons.arrow_back_ios)))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          state.loadingStatus is Loading
              ? const SizedBox(
                  height: 300,
                  child: Center(child: CircularProgressIndicator()),
                )
              : Image.network(
                  state.imageUrl,
                  height: 300,
                ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              40,
              16,
              40,
              0,
            ),
            child: SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Create at: ${state.date}'),
                  Text(state.catsFact),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              40,
              16,
              40,
              0,
            ),
            child: ButtonUtil.buildCommonButton(
              context,
              onPressed: () => context.read<FactBloc>().add(
                    FatchNewFact(),
                  ),
              buttonText: 'Another fact!',
            ),
          ),
        ],
      ),
    );
  }
}
