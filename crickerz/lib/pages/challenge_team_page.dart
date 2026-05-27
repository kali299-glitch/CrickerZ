import 'package:flutter/material.dart';

class ChallengeTeamPage extends StatelessWidget {
  const ChallengeTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenge a Team"),
      ),
      body: const Center(
        child: Text(
          "Challenge Team Page",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}