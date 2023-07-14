import 'package:bloc_cubbits_intro/presentation/blocs/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitsScreenCounter extends StatelessWidget {
  const CubitsScreenCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubitCounterBloc(),
    );
  }
}

class _CubitCounterBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ? forma 1 de cosumir el state del cubic
    // final counterState = context.watch<CounterCubit>().state;

    void increaseBy(BuildContext context, int value) {
      context.read<CounterCubit>().increaseBy(value);
    }

    return Scaffold(
      appBar: AppBar(
        // ? forma 2 de cosumir el state del cubic
        title: context.select((CounterCubit value) {
          return Text('Cubit counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().reset(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        // ? 3 forma dos de comsumir el cubit
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => previous.counter != current.counter,
          builder: (context, state) {
            return Text('Counter: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increaseBy(context, 1),
            heroTag: '1',
            child: const Text('+1'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => increaseBy(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => increaseBy(context, 3),
            heroTag: '3',
            child: const Text('+3'),
          ),
        ],
      ),
    );
  }
}
