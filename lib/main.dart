import 'package:flutter/material.dart';
import 'views/input_screen.dart';
import 'views/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Números Abundantes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: '/',
      routes: {'/': (context) => const InputScreen()},
      onGenerateRoute: (settings) {
        if (settings.name == '/result') {
          return MaterialPageRoute(
            builder: (context) => const ResultScreen(),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}
