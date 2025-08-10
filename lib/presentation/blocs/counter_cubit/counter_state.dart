part of 'counter_cubit.dart';

// Asi queremos que se vea la informacion. (va a cambiar con el tiempo)
class CounterState extends Equatable {
  final int counter;
  // Numero de veces que ha cambiado el contador
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});

  // Para emitir nuevos estados -> nueva instancia del estado.

  copyWith({final int? counter, final int? transactionCount}) => CounterState(
    // en caso de ser null, agarra el valor de la instancia actual.
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );

  @override
  // Todas las propiedades para considerar que el estado es igual. Estos son los campos que consideraremos.
  List<Object> get props => [counter, transactionCount];
  // Estamos haciendo esto ->
  // CounterState(0,0) == CounterState(0,0) ///True
}
