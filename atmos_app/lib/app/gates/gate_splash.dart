import 'package:flutter/material.dart';

class GateSplash extends StatelessWidget {
  const GateSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
