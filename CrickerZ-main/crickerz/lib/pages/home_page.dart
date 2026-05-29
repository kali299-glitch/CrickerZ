import 'package:crickerz/pages/challenge_team_page.dart';
import 'package:crickerz/pages/cricket_profile.dart';
import 'package:crickerz/pages/ongoing_matches.dart';
import 'package:crickerz/pages/start_match_page.dart';
import 'package:crickerz/widgets/action_button.dart';
import 'package:crickerz/widgets/match_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;

  final List<IconData> _navIcons = [
    Icons.menu,
    Icons.person_outline,
    Icons.home_outlined,
  ];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CricketProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Crickerz',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(Icons.chat_bubble_outline),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(13),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Team Dashboard',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _DashboardStat(label: 'Matches', value: '12'),
                          _DashboardStat(label: 'Wins', value: '8'),
                          _DashboardStat(label: 'Net RR', value: '+1.25'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Quick Actions',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Choose a feature to start your game.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ActionButton(
                              title: 'Start Match',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const StartMatchPage(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            ActionButton(
                              title: 'Ongoing Matches',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const OngoingMatchesPage(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            ActionButton(
                              title: 'Challenge a Team',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ChallengeTeamPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Recent Matches',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: const [
                          MatchCard(
                            team1: 'Bad Boyz',
                            score1: '125/7 (20.0 Ov)',
                            team2: 'Believers',
                            score2: '95/10 (20.0 Ov)',
                            result: 'Bad Boyz won by 30 runs',
                          ),
                          SizedBox(height: 12),
                          MatchCard(
                            team1: 'TSK',
                            score1: '125/7 (20.0 Ov)',
                            team2: 'BDS',
                            score2: '95/10 (20.0 Ov)',
                            result: 'TSK won by 25 runs',
                          ),
                          SizedBox(height: 12),
                          MatchCard(
                            team1: 'TSK',
                            score1: '125/7 (20.0 Ov)',
                            team2: 'BDS',
                            score2: '95/10 (20.0 Ov)',
                            result: 'TSK won by 25 runs',
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.greenAccent,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_navIcons.length, (index) {
            final isSelected = index == _selectedIndex;
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _onNavTap(index),
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withOpacity(0.25)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  _navIcons[index],
                  size: 28,
                  color: isSelected ? Colors.black : Colors.black87,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _DashboardStat extends StatelessWidget {
  final String label;
  final String value;

  const _DashboardStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.greenAccent.withAlpha(36),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
