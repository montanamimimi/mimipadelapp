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
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Column(      
    //     children: [
    //       Text(controller.tournament!.getDate()),        
    //       Expanded(
    //         child: ListView(
    //           children: [
    //             // ElevatedButton(
    //             //   onPressed: () { 
    //             //     // print(games);
    //             //     // print(players);
    //             //     print(controller.tournament);
    //             //   }, 
    //             //   child: Text("Debug Print tournament data")
    //             // ),

    //             for (int i = 0; i < controller.standings.length; i++)                     
    //               TournamentPlayerResult(
    //                 place: i + 1,
    //                 standing: controller.standings[i]
    //               )
    //           ],
    //           ),
    //       ),        
    //     ]        
    //   ),
    // );
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: const [
              SizedBox(width: 42),

              Expanded(child: SizedBox()),

              SizedBox(
                width: 40,
                child: Text("W-T-L", textAlign: TextAlign.end),
              ),

              SizedBox(width: 20),

              SizedBox(
                width: 70,
                child: Text("Diff", textAlign: TextAlign.center),
              ),

              SizedBox(width: 20),

              SizedBox(
                width: 45,
                child: Text("Points", textAlign: TextAlign.end),
              ),
            ],
          ),
        ),        
        Expanded(
          child: ListView.separated(
            itemCount: controller.standings.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final player = controller.standings[index];
          
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                child: Row(
                  children: [
          
                    // Name
                    Expanded(
                      child: Text(
                        "${index + 1}. ${player.playerName}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
          
                    // Points
                    SizedBox(
                      width: 40,
                      child: Text(
                        '${player.win}-${player.lose}-${player.tie}',
                        textAlign: TextAlign.end,
                      ),
                    ),
          
                    const SizedBox(width: 20),
          
                    // W-T-L
                    SizedBox(
                      width: 70,
                      child: Text(
                        '${player.diff}',
                        textAlign: TextAlign.center,
                      ),
                    ),
          
                    const SizedBox(width: 20),
          
                    // Diff
                    SizedBox(
                      width: 45,
                      child: Text(
                        '${player.score}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),                  
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}