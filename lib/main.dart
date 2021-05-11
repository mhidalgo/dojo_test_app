import 'package:dojo_test_app/screens/dojo_setup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DojoApp());
}

class DojoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DojoSetup(),
    );
  }
}
