import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

// Manejador del cubit. CounterState -> Como luce nuestro estado.
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 5));

  void increaseBy(int value) {
    // state inmutable.
    emit(
      state.copyWith(
        // No es obligatorio enviar todas las propiedades.
        counter: state.counter + value,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }

  void reset() {
    emit(state.copyWith(counter: 0));
  }
}
