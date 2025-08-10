import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({super.key});

  // Centralizado en un unico lugar.
  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // Para estar escuchando los cambios que tiene el state.
    final counterState = context.watch<CounterCubit>().state;
    final counterCubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        // para estar pendiente de un solo Bloc. (mas eficiente que el watch)
        title: context.select((CounterCubit value) {
          return Text("Cubit counter ${value.state.transactionCount}");
        }),
        // Text("Cubit counter ${counterState.transactionCount}"),
        actions: [
          IconButton(
            // context -> porque son llamadas rapidas.
            onPressed: () => context.read<CounterCubit>().reset(),
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter, // Reconstruir solo cuando son diferentes.
          builder: (context, state) {
            print('counter cambio');
            return Text('Counter value: ${state.counter}');
          },
        ),
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
            onPressed: () => counterCubit.increaseBy(2),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            // Para cuando tengamos mas de uno. tenemos que especificar que son diferentes.
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => context.read<CounterCubit>().increaseBy(1),
          ),
        ],
      ),
    );
  }
}
// equatable = nos permite saber cuando un bloc es distinto. Util para cuando queremos comparar objetos.
// equatable -> resuelve un problema para cuando tenemos objetos. Hace la comparacion en base al espacio en memoria. 
// ej -> final Person bob = Person("bob")
// print(bob == Person("bob")) //false. lo toma como otro objeto porque esta en distinto espacio en memoria.
// 