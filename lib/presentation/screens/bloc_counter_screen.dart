import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Para proveer el state del bloc
    return BlocProvider(
      //
      create: (_) => CounterBloc(),
      child: BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({super.key});

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    // .add permite disparar un evento
    // context.read<CounterBloc>().add(CounterIncreased(value));
    // Otra forma de hacerlo
    context.read<CounterBloc>().increaseBy(value);
  }

  // void resetCounter(BuildContext context) {
  //   // .add permite disparar un evento
  //   context.read<CounterBloc>().add(CounterReset());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc value) {
          return Text("Cubit counter ${value.state.transactionCount}");
        }),
        // Text("BLoC Counter"),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().resetCounter(),
            // onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) {
          return Text('Counter value: ${counterBloc.state.counter}');
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // Para cuando tengamos mas de uno. tenemos que especificar que son diferentes.
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => increaseCounterBy(context, 3),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            // Para cuando tengamos mas de uno. tenemos que especificar que son diferentes.
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => increaseCounterBy(context, 2),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            // Para cuando tengamos mas de uno. tenemos que especificar que son diferentes.
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => increaseCounterBy(context),
          ),
        ],
      ),
    );
  }
}
