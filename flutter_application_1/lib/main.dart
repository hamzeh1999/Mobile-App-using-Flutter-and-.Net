import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider_user/provider_user.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:flutter_application_1/screen/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProviderUser())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {
          'login': (_) => const LoginScreen(),
          'Home': (_) => const HomeScreen()
        },
        initialRoute: 'login',
      ),
    );
  }
}
