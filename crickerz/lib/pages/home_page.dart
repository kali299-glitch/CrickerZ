import 'package:crickerz/pages/ongoing_matches.dart';
import 'package:flutter/material.dart';
import 'package:crickerz/widgets/action_button.dart';
import 'package:crickerz/widgets/match_card.dart';
import 'package:crickerz/pages/start_match_page.dart';
import 'package:crickerz/pages/challenge_team_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      body: SafeArea(
        child: Column(
          children: [

            // TOP BAR
            Container(
              height: 80,
              color: Colors.greenAccent,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [

                  // LOGO
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        "Logo",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Expanded(
                    child: Text(
                      "PLAY CRICKET",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),

                  const Icon(Icons.chat_bubble_outline),
                  const SizedBox(width: 15),
                  const Icon(Icons.notifications_none),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // BUTTONS
            ActionButton(
              title: "Start Match",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StartMatchPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            ActionButton(
              title: "Ongoing Matches",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OngoingMatchesPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            ActionButton(
              title: "Challenge a Team",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChallengeTeamPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // MATCH LIST
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: const [

                  MatchCard(
                    team1: "Bad Boyz",
                    score1: "125/7 (20.0 Ov)",
                    team2: "Believers",
                    score2: "95/10 (20.0 Ov)",
                    result: "Bad Boyz won by 30 runs",
                  ),

                  SizedBox(height: 10),

                  MatchCard(
                    team1: "TSK",
                    score1: "125/7 (20.0 Ov)",
                    team2: "BDS",
                    score2: "95/10 (20.0 Ov)",
                    result: "TSK won by 25 runs",
                  ),

                  SizedBox(height: 10),

                  MatchCard(
                    team1: "TSK",
                    score1: "125/7 (20.0 Ov)",
                    team2: "BDS",
                    score2: "95/10 (20.0 Ov)",
                    result: "TSK won by 25 runs",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "",
          ),
        ],
      ),
    );
  }
}