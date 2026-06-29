import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';

class TournamentItem extends StatelessWidget {

  const TournamentItem({
    super.key, 
    required this.tournament, 
    required this.repository,
    });

  final Tournament tournament;
  final TournamentRepository repository;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.amber[100],
      child: InkWell(
        onTap: () {
          if (tournament.started) {
            Navigator.pushNamed(context, '/play', arguments: tournament.id);
          } else {
            Navigator.pushNamed(context, '/edit', arguments: tournament.id);
          }          
        },
        child: Row(
          children: [
            Text("id: ${tournament.id} "),
            Icon(
              Icons.deblur
            ),
            Text(tournament.name),
            Text(' ${tournament.courts} '),
            Text(tournament.getDate()),
          ],
        ),
      ),
    );
  }
}
