part of 'counter_bloc.dart';

// Para emitir nuevos eventos, se hace basado en eventos.
// Sin equatable porque es muy raro que se tenga que comparar eventos.
/// Util para saber qué tipos de eventos va a recibir nuestro bloc.
abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int value;

  const CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {
  const CounterReset();
}
