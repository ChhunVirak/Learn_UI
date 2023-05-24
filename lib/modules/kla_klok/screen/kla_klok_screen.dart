import 'package:flutter/material.dart';

class KlaKlok extends StatelessWidget {
  const KlaKlok({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Icon(Icons.home),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 70),
                textStyle: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
              child: const Text('ក្រឡុក'),
            )
          ],
        ),
      ),
    );
  }
}
