import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_bloc.dart';
import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_event.dart';
import 'package:fact_about_cat/bloc/facts_list_bloc/facts_list_state.dart';
import 'package:fact_about_cat/bloc/loading_status.dart';
import 'package:fact_about_cat/common/fact_model.dart';
import 'package:fact_about_cat/utils/button_util.dart';
import 'package:fact_about_cat/utils/facts_list_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FactsListView extends StatelessWidget {
  FactsListView(
    this.state, {
    super.key,
  });

  final FactsListState state;
  final _box = Hive.box<CatFactModel>('factModel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          left: 40,
        ),
        child: ButtonUtil.buildCommonButton(
          context,
          onPressed: () => context.read<FactsListBloc>().add(
                DeleteFact(),
              ),
          buttonText: 'Delete fact',
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.read<FactsListBloc>().add(
                OnFactView(),
              ),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('All facts about cats'),
      ),
      body: Scaffold(
        body: state.loadingStatus is Loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _box.length,
                itemBuilder: (_, index) {
                  return FactsListUtil.buildFactsListItem(
                    state.viewModel![index].date!,
                    state.viewModel![index].catsFact!,
                  );
                }),
      ),
    );
  }
}
