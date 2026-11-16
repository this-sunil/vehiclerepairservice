import 'package:material_ui/material_ui.dart';

class Player {
  final int id;
  final String name;
  final String role;
  final String country;

  // Batting Statistics
  final int runs;
  final int ballsFaced;
  final int fours;
  final int sixes;
  final double strikeRate;

  // Bowling Statistics
  final int wickets;
  final int runsConceded;
  final double oversBowled;
  final int maidens;
  final double economy;

  const Player({
    required this.id,
    required this.name,
    required this.role,
    required this.country,
    this.runs = 0,
    this.ballsFaced = 0,
    this.fours = 0,
    this.sixes = 0,
    this.strikeRate = 0,
    this.wickets = 0,
    this.runsConceded = 0,
    this.oversBowled = 0,
    this.maidens = 0,
    this.economy = 0,
  });
}

// Team A Player List

final List<Player> teamA = [
  Player(
    id: 1,
    name: 'Rohit Sharma',
    role: 'Batsman',
    country: 'India',
    runs: 264,
    ballsFaced: 173,
    fours: 33,
    sixes: 9,
    strikeRate: 152.60,
  ),
  Player(
    id: 2,
    name: 'Virat Kohli',
    role: 'Batsman',
    country: 'India',
    runs: 183,
    ballsFaced: 121,
    fours: 15,
    sixes: 3,
    strikeRate: 151.23,
  ),
  Player(
    id: 3,
    name: 'Shubman Gill',
    role: 'Batsman',
    country: 'India',
    runs: 208,
    ballsFaced: 149,
    fours: 19,
    sixes: 9,
    strikeRate: 139.59,
  ),
  Player(
    id: 4,
    name: 'KL Rahul',
    role: 'Wicket Keeper',
    country: 'India',
    runs: 112,
    ballsFaced: 95,
    fours: 8,
    sixes: 2,
    strikeRate: 117.89,
  ),
  Player(
    id: 5,
    name: 'Hardik Pandya',
    role: 'All Rounder',
    country: 'India',
    runs: 92,
    ballsFaced: 50,
    fours: 6,
    sixes: 4,
    strikeRate: 184.00,
    wickets: 5,
    runsConceded: 45,
    oversBowled: 8,
    economy: 5.62,
  ),
  Player(
    id: 6,
    name: 'Ravindra Jadeja',
    role: 'All Rounder',
    country: 'India',
    runs: 87,
    ballsFaced: 65,
    fours: 7,
    sixes: 2,
    strikeRate: 133.84,
    wickets: 3,
    runsConceded: 40,
    oversBowled: 8,
    economy: 5.00,
  ),
  Player(
    id: 7,
    name: 'Jasprit Bumrah',
    role: 'Bowler',
    country: 'India',
    runs: 10,
    ballsFaced: 8,
    wickets: 6,
    runsConceded: 30,
    oversBowled: 10,
    economy: 3.00,
  ),
  Player(
    id: 8,
    name: 'Mohammed Siraj',
    role: 'Bowler',
    country: 'India',
    runs: 5,
    ballsFaced: 6,
    wickets: 4,
    runsConceded: 35,
    oversBowled: 10,
    economy: 3.50,
  ),
  Player(
    id: 9,
    name: 'Kuldeep Yadav',
    role: 'Bowler',
    country: 'India',
    runs: 15,
    ballsFaced: 12,
    wickets: 3,
    runsConceded: 42,
    oversBowled: 10,
    economy: 4.20,
  ),
  Player(
    id: 10,
    name: 'Suryakumar Yadav',
    role: 'Batsman',
    country: 'India',
    runs: 117,
    ballsFaced: 55,
    fours: 14,
    sixes: 6,
    strikeRate: 212.72,
  ),
  Player(
    id: 11,
    name: 'Rishabh Pant',
    role: 'Wicket Keeper',
    country: 'India',
    runs: 128,
    ballsFaced: 85,
    fours: 12,
    sixes: 5,
    strikeRate: 150.58,
  ),
];

// Team B Player List

final List<Player> teamB = [
  Player(
    id: 1,
    name: 'Babar Azam',
    role: 'Batsman',
    country: 'Pakistan',
    runs: 158,
    ballsFaced: 120,
    fours: 14,
    sixes: 2,
    strikeRate: 131.66,
  ),
  Player(
    id: 2,
    name: 'Mohammad Rizwan',
    role: 'Wicket Keeper',
    country: 'Pakistan',
    runs: 131,
    ballsFaced: 105,
    fours: 11,
    sixes: 2,
    strikeRate: 124.76,
  ),
  Player(
    id: 3,
    name: 'Fakhar Zaman',
    role: 'Batsman',
    country: 'Pakistan',
    runs: 180,
    ballsFaced: 126,
    fours: 15,
    sixes: 8,
    strikeRate: 142.85,
  ),
  Player(
    id: 4,
    name: 'Shadab Khan',
    role: 'All Rounder',
    country: 'Pakistan',
    runs: 78,
    ballsFaced: 55,
    fours: 5,
    sixes: 3,
    strikeRate: 141.81,
    wickets: 4,
    runsConceded: 40,
    oversBowled: 8,
    economy: 5.00,
  ),
  Player(
    id: 5,
    name: 'Shaheen Afridi',
    role: 'Bowler',
    country: 'Pakistan',
    runs: 20,
    ballsFaced: 15,
    wickets: 5,
    runsConceded: 35,
    oversBowled: 10,
    economy: 3.50,
  ),
  Player(
    id: 6,
    name: 'Naseem Shah',
    role: 'Bowler',
    country: 'Pakistan',
    runs: 12,
    ballsFaced: 10,
    wickets: 3,
    runsConceded: 45,
    oversBowled: 10,
    economy: 4.50,
  ),
  Player(
    id: 7,
    name: 'Imam-ul-Haq',
    role: 'Batsman',
    country: 'Pakistan',
    runs: 151,
    ballsFaced: 130,
    fours: 12,
    sixes: 1,
    strikeRate: 116.15,
  ),
  Player(
    id: 8,
    name: 'Iftikhar Ahmed',
    role: 'All Rounder',
    country: 'Pakistan',
    runs: 109,
    ballsFaced: 70,
    fours: 8,
    sixes: 5,
    strikeRate: 155.71,
    wickets: 2,
    runsConceded: 30,
    oversBowled: 5,
    economy: 6.00,
  ),
  Player(
    id: 9,
    name: 'Haris Rauf',
    role: 'Bowler',
    country: 'Pakistan',
    runs: 8,
    ballsFaced: 7,
    wickets: 4,
    runsConceded: 50,
    oversBowled: 10,
    economy: 5.00,
  ),
  Player(
    id: 10,
    name: 'Abdullah Shafique',
    role: 'Batsman',
    country: 'Pakistan',
    runs: 113,
    ballsFaced: 95,
    fours: 10,
    sixes: 2,
    strikeRate: 118.94,
  ),
  Player(
    id: 11,
    name: 'Mohammad Nawaz',
    role: 'All Rounder',
    country: 'Pakistan',
    runs: 45,
    ballsFaced: 35,
    fours: 4,
    sixes: 1,
    strikeRate: 128.57,
    wickets: 2,
    runsConceded: 38,
    oversBowled: 7,
    economy: 5.42,
  ),
];

class CricketHomePage extends StatefulWidget {
  const CricketHomePage({super.key});

  @override
  State<CricketHomePage> createState() => _CricketHomePageState();
}

class _CricketHomePageState extends State<CricketHomePage> {
  bool showTeamA = true;

  @override
  Widget build(BuildContext context) {
    final List<Player> players = showTeamA ? teamA : teamB;
    final batsmen = teamA.where((player) => player.role == 'Batsman').toList();

    final bowlers = teamA.where((player) => player.role == 'Bowler').toList();

    final allRounders = teamA
        .where((player) => player.role == 'All Rounder')
        .toList();

    final wicketKeepers = teamA
        .where((player) => player.role == 'Wicket Keeper')
        .toList();

    final bats = teamB.where((player) => player.role == 'Batsman').toList();

    final bowl = teamB.where((player) => player.role == 'Bowler').toList();

    final allRounder = teamB
        .where((player) => player.role == 'All Rounder')
        .toList();

    final wicketKeeper = teamB
        .where((player) => player.role == 'Wicket Keeper')
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Cricket Teams'), centerTitle: true),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Total=> Batsman =>${batsmen.length},\n Bowler=> ${bowlers.length} All Rounder=>${allRounders.length} Wicket Keeper=>${wicketKeepers.length}",
          ),
          Text(
            "Total=> \n Batsman =>${bats.length},\n Bowler=> ${bowl.length} All Rounder=>${allRounder.length} Wicket Keeper=>${wicketKeeper.length}",
          ),
          // Team Selection
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showTeamA = true;
                      });
                    },
                    child: const Text('Team A'),
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showTeamA = false;
                      });
                    },
                    child: const Text('Team B'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Team Name
          Text(
            showTeamA ? 'India Squad' : 'Pakistan Squad',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          // Player List
          Expanded(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${player.id}')),
                    title: Text(
                      player.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${player.role} | ${player.country}'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Runs: ${player.runs}'),
                        Text('Wickets: ${player.wickets}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
