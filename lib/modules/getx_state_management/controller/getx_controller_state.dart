import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class IncrementCounterEvent extends CounterEvent {}

abstract class CounterState {
  int counter = 0;
}

class InitialCounterState extends CounterState {
  InitialCounterState();

  // @override
  // int counter = 0;
}

class UpdatedCounterState extends CounterState {
  UpdatedCounterState(int counter);

  // @override
  // int counter = 0;
}

class CounterController extends GetxController {
  final Rx<CounterState> _state = UpdatedCounterState(0).obs;
  // final Rx<CounterState> _state = InitialCounterState(0).obs;

  CounterState get currentState => _state.value;

  void onEvent(CounterEvent event) {
    if (event is IncrementCounterEvent) {
      _clickIncrement();
    }
  }

  void _clickIncrement() {
    final newCounter = currentState.counter + 1;
    final newState = UpdatedCounterState(newCounter);
    _state.value = newState;
  }
}
