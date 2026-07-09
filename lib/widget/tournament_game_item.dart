import 'package:flutter/material.dart';
import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:mimipadel/widget/form_fields/custom_dropdown_form_field.dart';

class TournamentGameItem extends StatefulWidget {

    const TournamentGameItem({
      super.key, 
      required this.controller,
      required this.gameId,
      required this.index,
    });

    final TournamentController controller;
    final int index;
    final int gameId;

  @override
  State<TournamentGameItem> createState() => _TournamentGameItemState();
}

class _TournamentGameItemState extends State<TournamentGameItem> {
    
    late int side1;
    late int side2;
    late String player1;
    late String player2;
    late String player3;
    late String player4;

    String getPlayerName(int id) {
      return widget.controller.players.firstWhere((e) => e.id == id).name;
    }

    void _getGameData() {
      final game = widget.controller.games.firstWhere(
        (g) => g.id == widget.gameId,
      );
      
      setState(() {
        side1 = game.side1Score;
        side2 = game.side2Score;
        player1 = getPlayerName(game.side1Player1Id);
        player2 = getPlayerName(game.side1Player2Id);
        player3 = getPlayerName(game.side2Player1Id);
        player4 = getPlayerName(game.side2Player2Id);        
      });
    }

    @override
    void initState() {
      super.initState();
      _getGameData();
    }

    Future<void> _updateGameScore() async {
      await widget.controller.updateGameScore(widget.gameId, side1, side2);
    }

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
        child: Column(
          children: [
            Text(
              "Court ${widget.index + 1}",
              style: TextStyle(
                backgroundColor: Colors.amber,
                fontSize: 18.0,
              ),              
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,                
                    children: [
                      Text(player1),
                      Text(player2),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomDropdownFormField(
                        initialValue: side1,
                        label: "Points",
                        items: List.generate(widget.controller.tournament!.points + 1, (i) => i),
                        onChanged: (value) async {                                                
                          setState(() {
                            side1 = value ?? 0;
                            side2 = widget.controller.tournament!.points - side1;                                      
                          });                              
                          await _updateGameScore();
                        },
                      ),
                    ],
                  ),
                ),              
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(player3),
                      Text(player4),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomDropdownFormField(
                        initialValue: side2,
                        label: "Points",
                        items: List.generate(widget.controller.tournament!.points + 1, (i) => i),
                        onChanged: (value) async {
                          setState(() {
                            side2 = value ?? 0;
                            side1 = widget.controller.tournament!.points - side2;           
                          });
                          await _updateGameScore();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
}
