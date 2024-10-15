import 'package:flutter/material.dart';
import 'package:tmpnp_application/screens/auth/registration_screen.dart';
import 'package:tmpnp_application/util/constants.dart';
import '../../location/location_view.dart';
import '../../widgets/pnp_button.dart';
import '../../widgets/pnp_input.dart';
import '../../widgets/pnp_oulined_button.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // @TODO implement login logic
  void _login() {
    // login logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const Text(
                                  'Welcome',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(primaryColor),
                                    fontSize: 20
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text('Are you 18 or older?', style: TextStyle(color: Color(primaryColor)),),
                                const SizedBox(height: 20,),
                                PnpButton('Yes', onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Location()))
                                  },
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      final snackBar = SnackBar(
                                        content: const Text('Sorry, you cannot use this app'),
                                        action: SnackBarAction(
                                          label: 'Okay',
                                          onPressed: () {
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );

                                      // Find the ScaffoldMessenger in the widget tree
                                      // and use it to show a SnackBar.
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    },
                                    child: const Text('No'))
                              ],
                            ),
                          )
                        ],
                      ));
                  },
                  child: const Text('Skip'),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Image.asset('assets/tm-click-n-collect-logo.png'),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Login to your account",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                  children: [
                    PnpInput(
                      label: 'Email',
                      controller: _usernameController,
                    ),
                    PnpInput(
                      label: 'Password',
                      obscureInput: true,
                      controller: _passwordController,
                    ),
                    PnpButton('Login',
                        onPressed: () {
                          String username = _usernameController.text;
                          String password = _passwordController.text;

                          if (username.isEmpty || password.isEmpty) {
                            final snackBar = SnackBar(
                              content: const Text('Username and password required!'),
                              action: SnackBarAction(
                                label: 'Okay',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const HomeScreen()));
                          }
                        }
                    ),
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
                    PnpOutlinedButton(
                      'Create Profile',
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationScreen()))
                      },
                    ),
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
