import 'package:flutter/material.dart';

class Settings_screen extends StatelessWidget {
  const Settings_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
