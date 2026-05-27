import 'package:flutter/material.dart';

class OngoingMatchesPage extends StatelessWidget {
  const OngoingMatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ongoing Matches"),
      ),
      body: const Center(
        child: Text(
          "Ongoing Matches Page",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}