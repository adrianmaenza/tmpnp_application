import 'package:flutter/material.dart';
import 'package:tmpnp_application/screens/auth/registration_screen.dart';

import '../../widgets/pnp_button.dart';
import '../../widgets/pnp_input.dart';
import '../../widgets/pnp_oulined_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Image.asset('assets/tm-click-n-collect-logo.png'),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Login to your account",
                            style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "We just sent you a temporary login code. Please check your email.",
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Form(
                    child: Column(
                      children: [
                        PnpInput(label: 'Email',),
                        PnpInput(label: 'Password',),
                        PnpButton('Login'),
                      ],
                    )),
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'New to TM Pick n Pay?',
                      style: TextStyle(
                        color: Color(0xFF173058),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PnpOutlinedButton('Create Profile', onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()))
                    },),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}