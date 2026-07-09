import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/widget/tournament_player_result.dart';

class ResultsTournamentView extends StatelessWidget {

  final TournamentController controller;

  const ResultsTournamentView({
    super.key,
    required this.controller,
  });

  String getPlayerName(int id) {
    return controller.players.firstWhere((e) => e.id == id).name;
  }  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(      
        children: [
          Text(controller.tournament!.getDate()),
          Expanded(
            child: ListView(
              children: [
                ElevatedButton(
                  onPressed: () { 
                    // print(games);
                    // print(players);
                    print(controller.tournament);
                  }, 
                  child: Text("Debug Print tournament data")
                ),   
                for (int i = 0; i < controller.standings.length; i++)                     
                  TournamentPlayerResult(
                    name: getPlayerName(controller.standings[i].playerId),
                    score: controller.standings[i].score,
                  )
              ],
              ),
          ),        
        ]        
      ),
    );
  }
}