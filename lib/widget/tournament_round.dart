import 'package:flutter/material.dart';
import 'package:mimipadel/widget/tournament_game_item.dart';
import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:mimipadel/models/tournament_game.dart';

class TournamentRound extends StatelessWidget {

    const TournamentRound({
      super.key,       
      required this.onNextRound,
      required this.onPrevRound,
      required this.controller,
    });

    final VoidCallback onNextRound;
    final VoidCallback onPrevRound;
    final TournamentController controller;

    List<TournamentGame> getRoundGames() {      
      return controller.games.where((g) => g.gameNumber == controller.round).toList();       
    }

    @override
    Widget build(BuildContext context) {            
      return Expanded(
          child: ListenableBuilder(
            listenable: controller, 
            builder: (context, child) {
              final roundGames = getRoundGames();
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [                
                      Column(
                        children: [
                          if (controller.round > 0)
                          IconButton(
                            onPressed: onPrevRound,
                            iconSize: 40.0,
                            icon: const Icon(
                              Icons.arrow_left
                            ),
                          ),
                        ],
                      ),
                    
                      Column(
                        children: [
                          if (controller.roundReady) 
                          IconButton(
                            onPressed: onNextRound,
                            iconSize: 40.0,
                            icon: const Icon(
                              Icons.arrow_right
                            ),
                          ),
                        ],
                      ),                
                    ],
                  ),
                  for (int i = 0; i < roundGames.length; i++)
                    TournamentGameItem(
                      key: ValueKey(roundGames[i].id),                      
                      gameId: roundGames[i].id,
                      index: i, 
                      controller: controller,
                    ),
                ]
              );
            }
          )
      );
    }
}