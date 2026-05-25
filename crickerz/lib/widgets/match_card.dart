import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final String team1;
  final String score1;

  final String team2;
  final String score2;

  final String result;

  const MatchCard({
    super.key,
    required this.team1,
    required this.score1,
    required this.team2,
    required this.score2,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                team1,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                score1,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                team2,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                score2,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Text(
            result,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}