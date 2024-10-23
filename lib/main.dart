import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tmpnp_application/screens/auth/login_screen.dart';
import 'package:tmpnp_application/util/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TM Pick and Pay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(primaryColor)),
        useMaterial3: true,
      ),
      home: const LoginScreen(title: 'Home Page'),
    );
  }
}
