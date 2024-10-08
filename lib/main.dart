import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TMPNP App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                      const SizedBox(height: 30,),
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
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email", textAlign: TextAlign.left),
                  const SizedBox(
                    height: 7.5,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade300)),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Password",
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 7.5),
                  TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade300)),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () => (),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF173058),
                        minimumSize: const Size.fromHeight(45)),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
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
                  const SizedBox(height: 20,),
                  OutlinedButton(
                      onPressed: () => {}, 
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(45)
                      ),
                      child: const Text("Create Profile")
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
