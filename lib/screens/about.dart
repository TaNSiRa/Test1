import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: QrImageView(
          data: 'https://www.google.co.th/?hl=th',
          version: QrVersions.auto,
          size: 300.0,
        ),
      ),
    );
  }
}
