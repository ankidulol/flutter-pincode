import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pincode/riverpod/pincode_state.dart';
import 'package:flutter_pincode/widgets/pincode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidatePincodeScreen extends ConsumerStatefulWidget {
  const ValidatePincodeScreen({super.key});

  @override
  ValidatePincodeScreenState createState() => ValidatePincodeScreenState();
}

class ValidatePincodeScreenState extends ConsumerState<ValidatePincodeScreen> {
  @override
  Widget build(BuildContext context) {
    final pin = ref.watch(pinProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Validate PIN Code',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: PinCode(
                4,
                (v) async {
                  if (v == pin) {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        padding: const EdgeInsets.all(20),
                        content: const Text('Correct PIN!'),
                        backgroundColor: Colors.green,
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => exit(0),
                            child: const Text('CLOSE APP'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      const MaterialBanner(
                        padding: EdgeInsets.all(20),
                        content: Text('Wrong PIN, closing app in 3 seconds'),
                        backgroundColor: Colors.red,
                        actions: <Widget>[
                          Text(""),
                        ],
                      ),
                    );
                    await Future.delayed(const Duration(seconds: 3));
                    exit(0);
                  }
                },
              ),
            ),
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
