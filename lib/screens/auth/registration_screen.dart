import 'package:flutter/material.dart';
import '../../widgets/pnp_button.dart';
import '../../widgets/pnp_input.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Register',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Your information is kept safe and will not be shared or sold. \nYour privacy if important to us.",
                            softWrap: true,
                            // Allows text to wrap to the next line
                            maxLines: null,
                            style: TextStyle(
                                color: Colors.white), // No limit on lines
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Your Details',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const PnpInput(
                  label: 'Name',
                ),
                const PnpInput(
                  label: 'Surname',
                ),
                const PnpInput(
                  label: 'Email',
                ),
                const PnpInput(
                  label: 'Mobile Number',
                ),
                const PnpInput(
                  label: 'Password',
                ),
                const PnpInput(
                  label: 'Confirm Password',
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (checked) => {}),
                    const SizedBox(
                      width: 1,
                    ),
                    const Expanded(
                      child: Text(
                        "I would like to receive specials and deals from TM Pick and Pay",
                        softWrap: true,
                        // Allows text to wrap to the next line
                        maxLines: null, // No limit on lines
                      ),
                    )
                  ],
                ),
                const PnpButton('Login'),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
