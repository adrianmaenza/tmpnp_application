import 'package:flutter/material.dart';
import 'package:tmpnp_application/util/constants.dart';

class PnpButton extends StatelessWidget {
  final String text;

  const PnpButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => (),
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(primaryColor),
          minimumSize: const Size.fromHeight(45)),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}