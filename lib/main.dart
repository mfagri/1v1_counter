import 'package:flutter/material.dart';
import 'package:oumlil_app/home.dart';
import 'package:oumlil_app/providres/game_provider.dart';
import 'package:oumlil_app/splash.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(
    ShowCaseWidget(
      builder: (context) => ChangeNotifierProvider(
        create: (_) => GameProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        // ... other routes
      },
    );
  }
}
