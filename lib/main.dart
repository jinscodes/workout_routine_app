import 'package:flutter/material.dart';
import 'package:workout_app/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)
            .copyWith(background: const Color(0xFFC5C5C5)),
      ),
      home: const Auth(),
    );
  }
}
