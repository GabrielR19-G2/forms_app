part of 'counter_bloc.dart';

// Estado propiamente del bloc
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;
  const CounterState({this.counter = 10, this.transactionCount = 0});

  CounterState copyWit({int? counter, int? transactionCount}) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  // Si no ponemos alguna propiedad definida dentro de los [ ], se va a ignorar y solo va a tomar los valores para comparar si cambio el state.
  @override
  List<Object> get props => [counter, transactionCount];
}
