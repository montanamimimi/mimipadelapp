import 'package:mimipadel/controllers/players_controller.dart';
import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/models/player.dart';
// import 'package:mimipadel/widget/form_fields/player_name_form_field.dart';

import 'package:mimipadel/widget/form_fields/player_autocomplete.dart';

class EditTournamentView extends StatefulWidget {

  final TournamentController controller;
  final PlayersController playersController;
  final VoidCallback onStart;

  const EditTournamentView({
    super.key,
    required this.controller,
    required this.playersController,
    required this.onStart,
  });

  @override
  State<EditTournamentView> createState() => _EditTournamentViewState();
}

class _EditTournamentViewState extends State<EditTournamentView> {
  // TextEditingController? _playerTextController;
  late PlayersController playersController;

  @override
  void dispose() {
    playersController.dispose();
    super.dispose();
  }

  Future<void> _addTournamentPlayer(Player? player, String name) async {
    if (name.isEmpty) return;

    final playerId = player?.id ??
        await widget.playersController.addPlayer(name);

    await widget.controller.addTournamentPlayer(name, playerId);
  }  

  // Future<void> _addTournamentPlayer(Player? player) async {    

  //   String playerId;   

  //   if (_playerTextController == null || _playerTextController!.text.isEmpty) {      
  //     return;
  //   }

  //   if (player == null) {
  //     playerId = await widget.playersController.addPlayer(_playerTextController!.text);      
  //   } else {
  //     playerId = player.id;
  //   }

  //   await widget.controller.addTournamentPlayer(_playerTextController!.text, playerId);

  //   _playerTextController?.clear();
  // }

  Future<void> _removeTournamentPlayer(String id) async {
    await widget.controller.removeTournamentPlayer(id);

  }  

  Future<void> _startTournament() async {    
    await widget.controller.startTournament();   
    widget.onStart();
  }  

  Future<void> _load() async {
    await widget.playersController.getPlayers();
    
    if (mounted) {
      setState(() {});
    }
  }  

  @override
  void initState() {
    super.initState();   
    _load();
  }  

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListenableBuilder(
      listenable: widget.controller, 
      builder: (context, child) {
        final tournament = widget.controller.tournament;

        if (tournament == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [                        
            Text("Courts to play: ${widget.controller.tournament!.courts}"),
            SizedBox(
              height: 12.0
            ),
            if (!widget.controller.gameReady)
            Text(
              "You should add ${widget.controller.tournament!.courts*4} players",
              style: TextStyle(
                fontSize: 18.0
              )
            ),
            if (!widget.controller.gameReady)
            SizedBox(
              height: 20.0
            ),      
            if (!widget.controller.gameReady)      
            PlayerAutocomplete(
              playersController: widget.playersController,
              tournamentPlayers: widget.controller.players,
              onSubmit: (player, name) async {
                await _addTournamentPlayer(player, name);
              },
            ),
            // Form(
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Autocomplete<Player>(
            //           optionsBuilder: (TextEditingValue textEditingValue) {
            //             if (textEditingValue.text.isEmpty) {
            //               return const Iterable<Player>.empty();
            //             }

            //             return widget.playersController.players.where((player) {
            //               return player.name.toLowerCase().contains(
            //                 textEditingValue.text.toLowerCase(),
            //               );  
            //             });
            //           },

            //           displayStringForOption: (player) => player.name,

            //           onSelected: (Player player) async {
            //             await _addTournamentPlayer(player);                                        
            //           },

            //           fieldViewBuilder: (
            //             BuildContext context,
            //             TextEditingController textController,
            //             FocusNode focusNode,
            //             VoidCallback onFieldSubmitted,
            //           ) {
            //             _playerTextController = textController;
            //             return TextFormField(
            //               controller: textController,
            //               focusNode: focusNode,
            //               decoration: const InputDecoration(
            //                 labelText: 'Player name',
            //                 hintText: 'Start typing...',
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //       IconButton(
            //         onPressed: () {
            //           _addTournamentPlayer(null);
            //         },
            //         icon: Icon(Icons.add)
            //       )                  
            //     ]
            //   ),
            // ),  
            if (widget.controller.gameReady) 
              ElevatedButton(
                onPressed: () async {
                  await _startTournament();
                },
                child: Row (
                  children: [
                    Text("Start tournament"),
                    Icon(
                      Icons.start,
                    )
                  ],
                )
              ),                      
            Flexible(
              fit: FlexFit.loose,
              child: ListView(
                children: [
                  ...widget.controller.players.asMap().entries.map(
                    (entry) {
                      final index = entry.key;
                      final player = entry.value;
              
                      return Row(
                        children: [                    
                          Text('${(index + 1).toString()}.'),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(player.name),
                          IconButton(
                            onPressed: () {
                              _removeTournamentPlayer(player.id);
                            },
                            icon: Icon(Icons.remove)
                          )

                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
      
          ],           
        );
        
      }
      )  
    );
  }
}

