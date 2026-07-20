import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament_standing.dart';

class TournamentPlayerResult extends StatelessWidget {

    const TournamentPlayerResult({
      super.key, 
      required this.place,
      required this.standing,
    });

    final TournamentStanding standing;
    final int place;

    @override
    Widget build(BuildContext context) {          
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0, 
          horizontal: 8.0
        ),
        child: Row(        
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [              
              Text(
                "$place. ${standing.playerName}", 
                style: TextStyle(
                  fontSize: 18.0,
                )
              ),
              Text(
                "${standing.win}-${standing.lose}-${standing.tie}"
              ),
              Text(standing.diff.toString()),
              Text(
                standing.score.toString(),
                style: TextStyle(
                  fontSize: 22.0,
                )                
              ),
            ],
          ),
      );
    }
}