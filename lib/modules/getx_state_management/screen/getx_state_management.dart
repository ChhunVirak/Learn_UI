import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/getx_controller_state.dart';

class GetxStateManagement extends StatefulWidget {
  const GetxStateManagement({super.key});

  @override
  State<GetxStateManagement> createState() => _GetxStateManagementState();
}

class _GetxStateManagementState extends State<GetxStateManagement> {
  final _controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder(
              init: _controller,
              builder: (controller) {
                final currentState = _controller.currentState;
                if (currentState is InitialCounterState) {
                  return const Text('Counter value: 0');
                } else if (currentState is UpdatedCounterState) {
                  return Text('Counter value: ${currentState.counter}');
                }
                return const Text('Error');
              },
            ),
            ElevatedButton(
              onPressed: () => _controller.onEvent(IncrementCounterEvent()),
              child: const Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
