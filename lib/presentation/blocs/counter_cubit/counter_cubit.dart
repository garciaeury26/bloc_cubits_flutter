import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 5));

  void increaseBy(int value) {
    // no es necesario usar un copy with
    emit(state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + value,
    ));
  }

  void reset() {
    emit(state.copyWith(counter: 0));
  }
}
