import 'package:flutter/material.dart';
// import 'package:mimipadel/models/tournament.dart';
// import 'package:mimipadel/widget/tournament_game_item.dart';
// import 'package:mimipadel/controllers/tournament_controller.dart';
// import 'package:mimipadel/models/tournament_game.dart';
// import 'package:mimipadel/models/tournament_player.dart';

class TournamentPlayerResult extends StatelessWidget {

    const TournamentPlayerResult({
      super.key, 

      required this.name,
      required this.score,
  
    });

    final String name;
    final int score;
    

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
                name, 
                style: TextStyle(
                  fontSize: 18.0,
                )
              ),
              Text(
                score.toString(),
                style: TextStyle(
                  fontSize: 22.0,
                )                
              ),
            ],
          ),
      );
    }
}