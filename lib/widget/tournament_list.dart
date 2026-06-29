import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/widget/tournament_item.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';

class TournamentList extends StatefulWidget {
  
  const TournamentList({
    super.key, 
    required this.tournaments,
    required this.repository,
    });

  final List<Tournament> tournaments;
  final TournamentRepository repository;

  @override
  State<TournamentList> createState() => _TournamentListState();
}

class _TournamentListState extends State<TournamentList> {

  late List<Tournament> tournaments;
  
  @override
  void initState() {
    super.initState();
    tournaments = widget.tournaments;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 8.0,
        children: tournaments.map((t) {
          return TournamentItem(
            tournament: t, 
            repository: widget.repository,
            );
        }).toList(),
      );
  }
}

