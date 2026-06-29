import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';

class TournamentRound extends StatelessWidget {

    const TournamentRound({
      super.key, 
      required this.tournament, 
      required this.repository,
    });

    final Tournament tournament;
    final TournamentRepository repository;

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [],
      );
    }
}