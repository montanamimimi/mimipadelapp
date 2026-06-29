import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/widget/tournament_round.dart';

class TournamentScreen extends StatefulWidget {
  final int tournamentId;
  final TournamentRepository repository;

  const TournamentScreen({
    super.key,
    required this.tournamentId,
    required this.repository,
  });

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  
  Tournament tournament = Tournament(id: 0, name: "", date: DateTime.now());
  List<TournamentPlayer> players = [];

  Future<void> updateTournament() async {
    // repository.updateTournament(tournament);
  }
  
  Future<void> _loadTournament() async {
    final result =
        await widget.repository.getTournamentById(widget.tournamentId);

    if (!mounted) return;

    if (result == null) {
      Navigator.pushReplacementNamed(context, '/');
      return;
    }

    setState(() {
      tournament = result;
    });

    await _loadPlayers();
  }

  Future<void> _loadPlayers() async {

    final result = await widget.repository.getTournamentPlayersById(tournament.id);

    setState(() {
      players = result;
    });
  }  

  @override
  void initState() {
    super.initState();
    _loadTournament();
  }
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tournament.name)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('${tournament.courts}'),
            Text(tournament.getDate()),
            TournamentRound(tournament: tournament, repository: widget.repository),            
          ],
          )
        ),
    );
  }
}