import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmpnp_application/screens/auth/registration_screen.dart';
import 'package:tmpnp_application/services/auth_service.dart';
import 'package:tmpnp_application/util/constants.dart';

import '../../bloc/app/app_bloc.dart';
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

  final AuthService authService = AuthService();

  bool showOtpMsg = false;
  bool loading = false;
  String errorMessage = '';

  Future<void> _login(BuildContext context) async {
    setState(() {
      loading = true;
      errorMessage = '';
    });
    String username = _usernameController.text;
    String password = _passwordController.text;
    // login logic

    try {
      final data =
          await authService.authenticateUser(AuthRequest(username, password));

      setState(() {
        loading = false;
      });

      if (context.mounted) {
        context.read<AppBloc>().add(Login(data));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LocationPicker()));
      }
    } catch (e) {
      print(e);
      setState(() {
        loading = false;
        errorMessage = 'There was an error logging in. Please try again.';
      });
    }
  }

  void _setShowOtp() {
    setState(() {
      showOtpMsg = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
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
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(height: 20),
                                            const Text(
                                              'Are you 18 or older?',
                                              style: TextStyle(
                                                  color: Color(primaryColor)),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            PnpButton(
                                              'Yes',
                                              onPressed: () => {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LocationPicker()))
                                              },
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  final snackBar = SnackBar(
                                                    content: const Text(
                                                        'Sorry, you cannot use this app'),
                                                    action: SnackBarAction(
                                                      label: 'Okay',
                                                      onPressed: () {
                                                        // Some code to undo the change.
                                                      },
                                                    ),
                                                  );

                                                  // Find the ScaffoldMessenger in the widget tree
                                                  // and use it to show a SnackBar.
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
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
                            SizedBox(
                              child: showOtpMsg
                                  ? const Text(
                                      "We just sent you a temporary login code. Please check your email.",
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center,
                                    )
                                  : const SizedBox
                                      .shrink(), // A fallback empty widget if needed
                            )
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


                          loading ? const LinearProgressIndicator() : const SizedBox(),

                          const SizedBox(height: 20,),

                          PnpButton('Login', onPressed: () {
                            String username = _usernameController.text;
                            String password = _passwordController.text;

                            if (username.isEmpty || password.isEmpty) {
                              final snackBar = SnackBar(
                                content: const Text(
                                    'Username and password required!'),
                                action: SnackBarAction(
                                  label: 'Okay',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );

                              // Find the ScaffoldMessenger in the widget tree
                              // and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              _login(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //         const HomeScreen()));
                            }
                          }),

                          const SizedBox(height: 20,),

                          errorMessage.isNotEmpty
                              ? Text(
                                  errorMessage.toString(),
                                  style: const TextStyle(color: Colors.red)
                                )
                              : const SizedBox(),


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
        },
      ),
    );
  }
}
