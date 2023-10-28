import 'package:builder_pattern/builder_pattern/builder_form_page.dart';
import 'package:builder_pattern/classic_method/classic_form_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Classic Method
          ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ClassicMethodFormPage())),
            child: const Text('Classic Method'),
          ),
          const SizedBox(height: 16),
          // Builder Pattern
          ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BuilderFormPage())),
            child: const Text('Builder Pattern'),
          ),
        ],
      )),
    );
  }
}
