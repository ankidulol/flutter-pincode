import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends ConsumerStatefulWidget {
  final bool obscured;
  final void Function(String)? onCompleted;

  const PinCode._({
    this.obscured = true,
    required this.onCompleted,
  });

  factory PinCode(int pinLength, void Function(String)? onCompleted) {
    return PinCode._(
      obscured: false,
      onCompleted: onCompleted,
    );
  }

  factory PinCode.obscured(int pinLength, void Function(String)? onCompleted) {
    return PinCode._(
      obscured: true,
      onCompleted: onCompleted,
    );
  }

  @override
  PinCodeState createState() => PinCodeState();
}

class PinCodeState extends ConsumerState<PinCode> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      obscureText: widget.obscured,
      length: 4,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      onCompleted: widget.onCompleted,
    );
  }
}
