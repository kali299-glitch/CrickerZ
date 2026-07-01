import 'package:flutter/material.dart';

class Player {
  final String name;
  final String role;

  const Player({required this.name, required this.role});
}

class AddSquadPage extends StatefulWidget {
  final String teamName;
  final List<Player> initialSelection;
  final bool isTeamA;

  const AddSquadPage({
    super.key,
    required this.teamName,
    required this.initialSelection,
    required this.isTeamA,
  });

  @override
  State<AddSquadPage> createState() => _AddSquadPageState();
}

class _AddSquadPageState extends State<AddSquadPage> {
  late List<Player> selectedPlayers;
  late final List<Player> availablePlayers;

  static const List<Player> teamAPlayers = [
    Player(name: 'Aiden Clarke', role: 'Batsman'),
    Player(name: 'Rohan Patel', role: 'All-Rounder'),
    Player(name: 'Jordan Reid', role: 'Bowler'),
    Player(name: 'Samir Kumar', role: 'Wicket-Keeper'),
    Player(name: 'Nikhil Sharma', role: 'Batsman'),
    Player(name: 'Liam Carter', role: 'Bowler'),
    Player(name: 'Milan Singh', role: 'All-Rounder'),
    Player(name: 'Leo Brooks', role: 'Batsman'),
    Player(name: 'Devon Roy', role: 'Bowler'),
    Player(name: 'Aarav Joshi', role: 'All-Rounder'),
    Player(name: 'Kunal Rana', role: 'Bowler'),
    Player(name: 'Ethan Mitchell', role: 'Batsman'),
    Player(name: 'Vikram Das', role: 'Wicket-Keeper'),
    Player(name: 'Riley Hayes', role: 'All-Rounder'),
    Player(name: 'Zain Malik', role: 'Bowler'),
  ];

  static const List<Player> teamBPlayers = [
    Player(name: 'Marcus Allen', role: 'Batsman'),
    Player(name: 'Daniel Brooks', role: 'All-Rounder'),
    Player(name: 'Henry Cole', role: 'Bowler'),
    Player(name: 'Noah Diaz', role: 'Wicket-Keeper'),
    Player(name: 'Oliver Evans', role: 'Batsman'),
    Player(name: 'Patrick Foster', role: 'Bowler'),
    Player(name: 'Quentin Gray', role: 'All-Rounder'),
    Player(name: 'Ryan Hunter', role: 'Batsman'),
    Player(name: 'Steven James', role: 'Bowler'),
    Player(name: 'Tyler King', role: 'All-Rounder'),
    Player(name: 'Victor Lewis', role: 'Bowler'),
    Player(name: 'William Morgan', role: 'Batsman'),
    Player(name: 'Xavier Nash', role: 'Wicket-Keeper'),
    Player(name: 'Yusuf Owen', role: 'All-Rounder'),
    Player(name: 'Zachary Price', role: 'Bowler'),
  ];

  @override
  void initState() {
    super.initState();
    selectedPlayers = List<Player>.from(widget.initialSelection);
    availablePlayers = widget.isTeamA ? teamAPlayers : teamBPlayers;
  }

  bool _isSelected(Player player) {
    return selectedPlayers.any((selected) => selected.name == player.name);
  }

  void _togglePlayer(Player player) {
    setState(() {
      if (_isSelected(player)) {
        selectedPlayers.removeWhere((selected) => selected.name == player.name);
      } else {
        selectedPlayers.add(player);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final int selectedCount = selectedPlayers.length;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Squad - ${widget.teamName}'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your squad players',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose at least 11 players from the list below for ${widget.teamName}.',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green.shade100),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Players Selected',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '$selectedCount / 11',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade100),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Available Players',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${availablePlayers.length}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: availablePlayers.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final player = availablePlayers[index];
                    final selected = _isSelected(player);
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 6),
                      onTap: () => _togglePlayer(player),
                      leading: CircleAvatar(
                        backgroundColor: selected
                            ? const Color(0xFF2E7D32)
                            : Colors.grey[200],
                        child: Text(
                          player.name.substring(0, 1),
                          style: TextStyle(
                            color: selected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        player.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(player.role),
                      trailing: Checkbox(
                        value: selected,
                        onChanged: (_) => _togglePlayer(player),
                        activeColor: const Color(0xFF2E7D32),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedCount >= 11
                      ? () {
                          Navigator.pop(context, selectedPlayers);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    disabledBackgroundColor: Colors.grey.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    selectedCount >= 11
                        ? 'Save Squad ($selectedCount)'
                        : 'Select 11 players to continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedCount >= 11
                          ? Colors.white
                          : Colors.grey[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
