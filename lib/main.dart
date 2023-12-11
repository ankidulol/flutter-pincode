import 'package:flutter/material.dart';
import 'package:flutter_pincode/screens/pincode.dart';
import 'package:flutter_pincode/screens/validate_pincode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const PincodeScreen(),
        '/validate': (context) => const ValidatePincodeScreen()
      },
    );
  }
}
