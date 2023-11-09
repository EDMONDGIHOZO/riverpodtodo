import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtodo/app/config/theme/app_theme.dart';
import 'package:riverpodtodo/routes/routes_provider.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routesProvider);
    return MaterialApp.router(
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routerConfig: routeConfig,
    );
  }
}
