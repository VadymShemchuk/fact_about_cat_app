abstract class FactsListEvent {}

class GetLoadedFacts extends FactsListEvent {}

class DeleteFact extends FactsListEvent {
  int factIndex;
  DeleteFact({
    required this.factIndex,
  });
}

class OnFactView extends FactsListEvent {}
