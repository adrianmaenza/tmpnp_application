import 'package:flutter/material.dart';

class PnpInput extends StatelessWidget {
  final String label;
  const PnpInput({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, textAlign: TextAlign.left),
        const SizedBox(
          height: 7.5,
        ),
        TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                filled: true,
                fillColor: Colors.grey.shade300)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
