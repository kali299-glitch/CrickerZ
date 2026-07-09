import 'package:flutter/material.dart';
import 'add_squad_page.dart';
import 'create_team_page.dart';

class StartMatchPage extends StatefulWidget {
  const StartMatchPage({super.key});

  @override
  State<StartMatchPage> createState() => _StartMatchPageState();
}

class _StartMatchPageState extends State<StartMatchPage> {
  String? selectedTeamA;
  String? selectedTeamB;
  List<Player> selectedTeamASquad = [];
  List<Player> selectedTeamBSquad = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 2,
        shadowColor: Colors.black26,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        title: const Text(
          "Crickerz",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.chat_outlined,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: Column(
          children: [
            // Header Section
            Container(
              color: const Color(0xFF81C784),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black87,
                      size: 20,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Team",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Choose teams for your match",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Content area
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 28),
                    // Team A Section
                    _buildTeamCard(
                      context,
                      "Team A",
                      selectedTeam: selectedTeamA,
                      isSelected: selectedTeamA != null,
                      squadCount: selectedTeamASquad.length,
                      onSelectTeam: () => _showTeamSelection(context, true),
                      onCreateTeam: () {
                        _navigateToNextPage(context, "Create Team");
                      },
                    ),
                    const SizedBox(height: 24),
                    // VS Divider
                    _buildVSDivider(),
                    const SizedBox(height: 24),
                    // Team B Section
                    _buildTeamCard(
                      context,
                      "Team B",
                      selectedTeam: selectedTeamB,
                      isSelected: selectedTeamB != null,
                      squadCount: selectedTeamBSquad.length,
                      onSelectTeam: () => _showTeamSelection(context, false),
                      showCreateButton: false,
                    ),
                    const SizedBox(height: 32),
                    // Start Match Button
                    if (selectedTeamA != null &&
                        selectedTeamB != null &&
                        selectedTeamASquad.isNotEmpty &&
                        selectedTeamBSquad.isNotEmpty)
                      _buildStartButton(context),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamCard(
    BuildContext context,
    String teamName, {
    required String? selectedTeam,
    required int squadCount,
    required VoidCallback onSelectTeam,
    VoidCallback? onCreateTeam,
    bool showCreateButton = true,
    required bool isSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Team Avatar with Badge
          Stack(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.grey[300]!, Colors.grey[200]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.group_outlined,
                  size: 50,
                  color: Colors.grey[600],
                ),
              ),
              if (isSelected)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2E7D32),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          // Select Team Button
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: onSelectTeam,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF66BB6A),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
              ),
              child: Text(
                selectedTeam ?? "Select $teamName",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
          if (selectedTeam != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                squadCount == 1
                    ? '1 Player Selected'
                    : '$squadCount Players Selected',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          // Create Team Button (only for Team A)
          if (showCreateButton) ...[
            const SizedBox(height: 16),
            // OR Divider
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.grey[400]!],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey[400]!, Colors.transparent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: onCreateTeam,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF2E7D32),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: Color(0xFF66BB6A), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Create Team",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVSDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF81C784), Colors.transparent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2E7D32).withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "VS",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, const Color(0xFF81C784)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Handle start match
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Starting match: $selectedTeamA vs $selectedTeamB",
                ),
                duration: const Duration(milliseconds: 1500),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
          ),
          child: const Text(
            "Start Match",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  void _showTeamSelection(BuildContext context, bool isTeamA) {
    final List<String> teams = [
      "Team Lions",
      "Team Tigers",
      "Team Eagles",
      "Team Panthers",
      "Team Kings",
      "Team Warriors",
      "Team Challengers",
      "Team Royals",
    ];
    final TextEditingController searchController = TextEditingController();
    String searchQuery = "";

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          final filteredTeams = teams
              .where(
                (team) =>
                    team.toLowerCase().contains(searchQuery.toLowerCase()),
              )
              .toList();

          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text(
              "Select Team",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search team name",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF66BB6A),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2E7D32),
                          width: 1.8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Future.microtask(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateTeamPage(),
                            ),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFF2E7D32),
                        size: 20,
                      ),
                      label: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'Create new team',
                          style: TextStyle(
                            color: Color(0xFF2E7D32),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF2E7D32)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    constraints: const BoxConstraints(maxHeight: 280),
                    child: filteredTeams.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Text(
                                "No teams found.",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemCount: filteredTeams.length,
                            separatorBuilder: (_, _) =>
                                const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final teamName = filteredTeams[index];
                              return _buildTeamOption(context, teamName, (
                                team,
                              ) {
                                final previousTeam = isTeamA
                                    ? selectedTeamA
                                    : selectedTeamB;
                                this.setState(() {
                                  if (isTeamA) {
                                    if (team != previousTeam) {
                                      selectedTeamASquad = [];
                                    }
                                    selectedTeamA = team;
                                  } else {
                                    if (team != previousTeam) {
                                      selectedTeamBSquad = [];
                                    }
                                    selectedTeamB = team;
                                  }
                                });
                                Navigator.pop(context);
                                Future.microtask(() async {
                                  final selectedPlayers =
                                      await Navigator.push<List<Player>>(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddSquadPage(
                                            teamName: team,
                                            isTeamA: isTeamA,
                                            initialSelection: isTeamA
                                                ? selectedTeamASquad
                                                : selectedTeamBSquad,
                                          ),
                                        ),
                                      );
                                  if (selectedPlayers != null) {
                                    this.setState(() {
                                      if (isTeamA) {
                                        selectedTeamASquad = selectedPlayers;
                                      } else {
                                        selectedTeamBSquad = selectedPlayers;
                                      }
                                    });
                                  }
                                });
                              });
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTeamOption(
    BuildContext context,
    String teamName,
    Function(String) onSelect,
  ) {
    return ListTile(
      onTap: () => onSelect(teamName),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5E9),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.groups, color: Color(0xFF2E7D32), size: 22),
      ),
      title: Text(
        teamName,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
    );
  }

  void _showCreateTeamDialog(
    BuildContext context,
    Function(String) onTeamCreated,
  ) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          "Create Team",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter team name",
                hintStyle: TextStyle(color: Colors.grey[400]),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF66BB6A),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF2E7D32),
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                onTeamCreated(controller.text);
                Navigator.pop(context);
                // Navigate to CreateTeamPage with the team name
                Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CreateTeamPage(initialTeamName: controller.text),
                    ),
                  );
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Next",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToNextPage(BuildContext context, String actionType) {
    // Navigate to the next page based on action type.
    // Only Create Team should immediately open a new page.
    if (actionType != "Create Team") return;

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateTeamPage()),
      );
    });
  }
}
