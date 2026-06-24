import 'package:flutter/material.dart';

class ChallengeTeamPage extends StatefulWidget {
  const ChallengeTeamPage({super.key});

  @override
  State<ChallengeTeamPage> createState() => _ChallengeTeamPageState();
}

class _ChallengeTeamPageState extends State<ChallengeTeamPage> {
  String? selectedTeamA;
  String? selectedTeamB;

  final List<String> teams = [
    'Team A',
    'Team B',
    'Team C',
    'Team D',
    'Team E',
    'Team F',
  ];

  void _onTeamSelected(String team, bool isTeamA) {
    setState(() {
      if (isTeamA) {
        selectedTeamA = team;
      } else {
        selectedTeamB = team;
      }
    });
  }

  void _proceedToSquadSelection() {
    if (selectedTeamA != null && selectedTeamB != null) {
      // Navigate to squad selection page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              SelectSquadPage(teamA: selectedTeamA!, teamB: selectedTeamB!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Challenge a Team"), elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Team A Selection
                _buildTeamSelectionSection(
                  title: 'Select Team A',
                  selectedTeam: selectedTeamA,
                  onTeamSelected: (team) => _onTeamSelected(team, true),
                  teams: teams,
                ),
                const SizedBox(height: 32),

                // Team B Selection
                _buildTeamSelectionSection(
                  title: 'Select Team B',
                  selectedTeam: selectedTeamB,
                  onTeamSelected: (team) => _onTeamSelected(team, false),
                  teams: teams.where((team) => team != selectedTeamA).toList(),
                ),
                const SizedBox(height: 40),

                // Proceed Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: selectedTeamA != null && selectedTeamB != null
                        ? _proceedToSquadSelection
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF50C878),
                      disabledBackgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Proceed to Squad Selection',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedTeamA != null && selectedTeamB != null
                            ? Colors.white
                            : Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamSelectionSection({
    required String title,
    required String? selectedTeam,
    required Function(String) onTeamSelected,
    required List<String> teams,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        if (selectedTeam != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF50C878).withOpacity(0.1),
              border: Border.all(color: const Color(0xFF50C878), width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Color(0xFF50C878)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    selectedTeam,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          )
        else
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'No team selected',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: teams
              .map(
                (team) => ChoiceChip(
                  label: Text(team),
                  selected: selectedTeam == team,
                  onSelected: (_) => onTeamSelected(team),
                  backgroundColor: Colors.grey.shade200,
                  selectedColor: const Color(0xFF50C878),
                  labelStyle: TextStyle(
                    color: selectedTeam == team ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

// Squad Selection Page
class SelectSquadPage extends StatefulWidget {
  final String teamA;
  final String teamB;

  const SelectSquadPage({super.key, required this.teamA, required this.teamB});

  @override
  State<SelectSquadPage> createState() => _SelectSquadPageState();
}

class _SelectSquadPageState extends State<SelectSquadPage> {
  late String selectedTeam;

  @override
  void initState() {
    super.initState();
    selectedTeam = widget.teamA;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Squad"), elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select squad for $selectedTeam',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.blue.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selected Teams:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Team A: ${widget.teamA}'),
                      Text('Team B: ${widget.teamB}'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Squad Selection Placeholder',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Squad selection UI will be added here',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
