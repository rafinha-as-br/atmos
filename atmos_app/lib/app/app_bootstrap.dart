import 'package:flutter/material.dart';
import 'app.dart';

class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    // This could also be where global providers are wrapped
    return const AtmosApp();
  }
}
