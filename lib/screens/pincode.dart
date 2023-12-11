import 'package:flutter/material.dart';
import 'package:flutter_pincode/riverpod/pincode_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PincodeScreen extends ConsumerStatefulWidget {
  const PincodeScreen({super.key});

  @override
  PincodeScreenState createState() => PincodeScreenState();
}

class PincodeScreenState extends ConsumerState<PincodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter PIN Code',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: PinCodeTextField(
                appContext: context,
                obscureText: true,
                length: 4,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                onCompleted: (v) {
                  ref.read(pinProvider.notifier).state = v;
                  Navigator.pushNamed(context, '/validate');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
