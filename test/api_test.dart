import 'package:change_language/modules/auth/controller/auth_controller.dart';
import 'package:change_language/modules/auth/controller/service_provider.dart';
import 'package:change_language/util/extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../integration_test/auth_test.dart';

void main() {
  final auth = Get.put(AuthController());
  final service = Service();
  group('Test Api Authentication', () {
    test('🌐 Fetch Albums', () async {
      await delayed(200.ms);
      final a = await auth.fetchListAlbums();
      expect(
        a.statusCode,
        200,
      );
    });

    test('🌐 Fetch Coments', () async {
      await delayed(200.ms);
      final a = await auth.fetchListComments();
      expect(a.statusCode, 200);
    });

    test('🌐 Fetch Photos', () async {
      await delayed(200.ms);
      final a = await auth.fetchListPhotos();
      expect(a.statusCode, 200);
    });

    test('🌐 Fetch Posts', () async {
      await delayed(200.ms);
      final a = await auth.fetchListPosts();
      expect(a.statusCode, 200);
    });

    test('🌐 Fetch Todos', () async {
      await delayed(200.ms);
      final a = await auth.fetchListTodos();
      expect(a.statusCode, 200);
    });

    test('🌐 Fetch Users', timeout: const Timeout.factor(2), () async {
      await delayed(200.ms);
      final a = await auth.fetchListUsers();

      expect(a.statusCode, greaterThanOrEqualTo(200));
    });
    test('🌐 Fetch Api', timeout: const Timeout.factor(2), () async {
      await delayed(200.ms);
      final a = await service.fetchApi();

      expect(a.statusCode, greaterThanOrEqualTo(200));
    });
  });
}
