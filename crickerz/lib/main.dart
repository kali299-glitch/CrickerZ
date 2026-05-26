import 'package:crickerz/pages/challenge_team_page.dart';
import 'package:crickerz/pages/cricket_profile.dart';
import 'package:crickerz/pages/login.dart';
import 'package:crickerz/pages/ongoing_matches.dart';
import 'package:crickerz/pages/signup.dart';
import 'package:crickerz/pages/start_match_page.dart';
import 'package:crickerz/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/cprofile': (context) => const CricketProfilePage(),
        '/home': (context) => const HomePage(),
        '/start_match': (context) => const StartMatchPage(),
        '/ongoing_matches': (context) => const OngoingMatchesPage(),
        '/challenge_team': (context) => const ChallengeTeamPage(),
      },
      home: const LoginPage(),
    );
  }
}
