import 'package:flutter/material.dart';

import '../util/constants.dart';

class PnpOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;  // Add a callback for the button press

  const PnpOutlinedButton(this.text, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,  // Call the passed function when button is pressed
      style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          foregroundColor: const Color(primaryColor)
      ),
      child: Text(text),
    );
  }
}