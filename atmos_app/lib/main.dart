import 'package:flutter/material.dart';
import 'app/app_injector.dart';
import 'app/app_bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Dependency Injection
  await AppInjector.init();
  
  runApp(const AppBootstrap());
}
