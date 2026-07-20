import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/widget/tournament_round.dart';

class PlayTournamentView extends StatelessWidget {

  final VoidCallback onNextRound;
  final VoidCallback onPrevRound;  
  final TournamentController controller;

  const PlayTournamentView({
    super.key,
    required this.onNextRound,
    required this.onPrevRound,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Text(controller.tournament!.getDate()),
          ListenableBuilder(
            listenable: controller, 
            builder: (context, child) {
              return Text(
                  "ROUND ${controller.round + 1}",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  )
                );
              }

          ),
          // ElevatedButton(
          //   onPressed: () { 
          //     print(controller.tournament);
          //     // print(controller.standings);
          //     // print(controller.games);
          //     // print(controller.players);
          //   }, 
          //   child: Text("Debug Print tournament data")
          // ),
          TournamentRound(
            onNextRound: onNextRound,
            onPrevRound: onPrevRound,
            controller: controller,
            ),
        ],
      ),
    );
  }
}