import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// Maneja state, fluye de manera diferente
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Constructor e inicializa el state. Cuerpo del constructor. -> manejador de eventos
  CounterBloc() : super(const CounterState()) {
    //Evento/Manejador de evento
    // on<CounterIncreased>((event, emit) {
    //   emit(
    //     state.copyWit(
    //       counter: state.counter + event.value,
    //       transactionCount: state.transactionCount + 1,
    //     ),
    //   );
    // });
    // Forma mas comun
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
  }
  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(
      state.copyWit(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWit(counter: 0));
  }

  /// Forma en la que se va a incrementar el counterBloc
  void increaseBy([int value = 1]) {
    add(CounterIncreased(value));
  }

  void resetCounter() {
    add(CounterReset());
  }
}
