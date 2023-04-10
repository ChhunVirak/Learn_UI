import 'package:get/get.dart';

class MyState<T1, T2> {
  //T3, T4, T5, . . .
  T1? state1;
  T2? state2;

  MyState({
    this.state1,
    this.state2,
  });
}

abstract class BaseController<T1, T2> extends GetxController
    with StateMixin<MyState<T1, T2>> {}

class MultipleStateController extends BaseController<String, int> {
  @override
  void onInit() {
    change(null, status: RxStatus.empty()); //eg. Initial empty
    change(MyState(state1: 'Fanny', state2: 18),
        status: RxStatus.empty()); //eg. Initial Value
    super.onInit();
  }
}
