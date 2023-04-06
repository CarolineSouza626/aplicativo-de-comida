import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marmita/service/auth_service.dart';
import 'package:marmita/widgets/auth_Check.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => Auth_Service())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marmitaria 2.0',
      // theme: context.watch<AppProvider>().theme,
      theme: theme.copyWith(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.amber[800],
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.amber[800],
          secondary: Colors.amber,
        ),
      ),
      home: const AuthCheck(),
    );
  }
}
