import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrettyQr(
          data: 'Hello',
          size: 250,
          // elementColor: Colors.indigo[900]!,
          errorCorrectLevel: QrErrorCorrectLevel.Q,
          image: const NetworkImage(
              'https://cic-association.com/wp-content/uploads/2020/05/CIC-Logo.png'),
          roundEdges: true,
        ),
      ),
    );
  }
}
