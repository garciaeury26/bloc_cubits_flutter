import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 5)) {
    // on<CounterIncreased>((event, emit) {
    //   emit(state.copyWith(
    //     counter: state.counter + event.value,
    //     transactionCount: state.counter + 1,
    //   ));
    // });

    on<CounterIncreased>(_onCounterIncreased);
    on<ResetEvent>(_onReset);
  }
  void _onReset(ResetEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: 5,
    ));
  }

  void reset() {
    add(ResetEvent());
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void counterIncresed([int value = 5]) {
    add(CounterIncreased(value));
  }
}
