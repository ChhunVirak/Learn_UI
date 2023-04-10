// import 'package:change_language/util/extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';

// import 'package:change_language/main.dart' as app;

// void main() async {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW
//   group('🔑 Authorization Test', () {
//     testWidgets('Authorization Test', (tester) async {
//       //setup
//       app.main();
//       await tester.pumpAndSettle();
//       final button = find.byKey(const Key('btnLogin'));

//       //do
//       final tbPhone = find.byKey(const Key('tbPhone'));
//       final tbPassword = find.byKey(const Key('tbPassword'));

//       await tester.enterText(tbPhone, '099663857');

//       await delayed(2000.ms);
//       await tester.enterText(tbPassword, 'Rak05052002');

//       await delayed(2000.ms);
//       await tester.tap(button);

//       await tester.pumpAndSettle();

//       //test
//       expect(1, 1);
//     });
//   });
// }

Future<void> delayed(Duration delay) async {
  await Future.delayed(delay);
}
