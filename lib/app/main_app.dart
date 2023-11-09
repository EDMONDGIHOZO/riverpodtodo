import 'package:flutter/material.dart';
import 'package:riverpodtodo/app/config/theme/app_theme.dart';
import 'package:riverpodtodo/screens/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen());
  }
}
