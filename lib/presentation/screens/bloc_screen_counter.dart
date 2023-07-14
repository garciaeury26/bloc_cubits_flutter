import 'package:bloc_cubbits_intro/presentation/blocs/countet_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreenCounter extends StatelessWidget {
  const BlocScreenCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _CounterView(),
    );
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    void incresedBy(BuildContext context, [int value = 5]) {
      // ? forma 1
      // context.read<CounterBloc>().add(CounterIncreased(value));
      // ? forma 2 desde el bloc
      context.read<CounterBloc>().counterIncresed(value);
    }

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) {
          return Text('${counterBloc.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterBloc>().add(ResetEvent());
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) {
          return Text('${counterBloc.state.counter}');
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => incresedBy(context, 1),
            heroTag: '1',
            child: const Text('+1'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => incresedBy(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => incresedBy(context, 3),
            heroTag: '3',
            child: const Text('+3'),
          ),
        ],
      ),
    );
  }
}
