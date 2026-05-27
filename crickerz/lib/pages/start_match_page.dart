import 'package:flutter/material.dart';

class StartMatchPage extends StatelessWidget {
  const StartMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Start Match"),
      ),
      body: const Center(
        child: Text(
          "Start Match Page",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}