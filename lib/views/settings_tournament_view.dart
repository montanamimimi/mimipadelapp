import 'package:mimipadel/controllers/players_controller.dart';
import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/widget/dialogs/text_input_dialog.dart';
import 'package:mimipadel/widget/dialogs/confirm_dialog.dart';
import 'package:mimipadel/widget/dialogs/check_option_dialog.dart';
import 'package:mimipadel/widget/form_fields/player_autocomplete.dart';
import 'package:mimipadel/models/player.dart';

class SettingsTournamentView extends StatefulWidget {

  final TournamentController controller;
  final PlayersController playersController;

  const SettingsTournamentView({
    super.key,
    required this.controller,
    required this.playersController,
  });

  @override
  State<SettingsTournamentView> createState() => _SettingsTournamentViewState();
}

class _SettingsTournamentViewState extends State<SettingsTournamentView> {
  
  Future<void> _deleteTournament() async {
    await widget.controller.delete();
    if (!mounted) return;
    Navigator.pop(context, true);
  }

  Future<void> _syncTournament() async {
    await widget.controller.sync();
    setState(() {});
  }  

  Future<void> _changeTournamentPlayer(TournamentPlayer player, Player? newPlayer, String name) async {

    if (name.isEmpty) return;

    final playerId = newPlayer?.id ??
        await widget.playersController.addPlayer(name);

    await widget.controller.changeTournamentPlayer(player.id, playerId, name);    
    
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
      child: 
      ListenableBuilder(
        listenable: widget.controller, 
        builder: (context, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Title: "),
                  Text(widget.controller.tournament!.name),
                  IconButton(
                    onPressed: () async {
                      final name = await showTextInputDialog(
                        context: context,
                        title: 'Rename tournament',
                        initialValue: widget.controller.tournament!.name,
                        hintText: 'Tournament name',
                      );

                      if (name != null && name.isNotEmpty) {
                        widget.controller.updateName(name);                       
                      }                      
                    }, 
                    icon: Icon(
                      Icons.edit
                    )
                  )
                ],
              ),
              Row(children: [
                Text(widget.controller.tournament!.id),
              ],),
              Row(
                children: [
                  Text("Format: ${widget.controller.tournament!.format}"),
                ]
              ),
              Row(
                children: [
                  Text("Date: ${widget.controller.tournament!.getDate()}"),
                ]
              ),
              Row(
                children: [
                  Text("Courts to play: ${widget.controller.tournament!.courts}"),
                ]
              ),
              if (widget.controller.tournament!.format == 'mexicano') 
              Row(
                children: [
                  const Text("Should we MAX MIX players?"),
                  Switch(
                    value: widget.controller.tournament!.mixer,
                    onChanged: widget.controller.switchMixer,
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Points to play: ${widget.controller.tournament!.points.toString()}"),
                  IconButton(
                    onPressed: () async {
                      
                      final points = await showCheckOptionDialog(
                        context: context,
                        title: 'Points to play',
                        options: [
                          CheckOption(
                            key: '16',
                            value: '16',
                          ),
                          CheckOption(
                            key: '21',
                            value: '21',
                          ),         
                          CheckOption(
                            key: '24',
                            value: '24',
                          ),
                          CheckOption(
                            key: '32',
                            value: '32',
                          ),                                   
              ],
                      );

                      if (points != null && points.isNotEmpty) {
                        final number = int.parse(points);
                        widget.controller.updatePointsToPlay(number);                       
                      }

                    }, 
                    icon: Icon(
                      Icons.edit
                    )
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    ...widget.controller.players.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final player = entry.value;
                
                        return Row(
                          children: [                         
                            IconButton(
                              onPressed: () async {                                
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Change player'),
                                      actions: const [],
                                      content: SizedBox(
                                        width: 400,
                                        child: PlayerAutocomplete(
                                          playersController: widget.playersController,
                                          tournamentPlayers: widget.controller.players,
                                          onSubmit: (newPlayer, name) async {
                                           
                                            await _changeTournamentPlayer(player, newPlayer, name);

                                            FocusManager.instance.primaryFocus?.unfocus();

                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              if (context.mounted) {
                                                Navigator.of(context).pop();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );                               
                              }, 
                              icon: Icon(
                                Icons.edit,
                                size: 14.0
                              )
                            ),
                            Text('${(index + 1).toString()}.'),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(player.name),                            
                          ],
                        );
                      },
                    ),
                    if(
                      (widget.controller.round) > 0 
                      && 
                      (widget.controller.round == widget.controller.getMaxRound())
                      &&
                      (widget.controller.tournament!.format != 'americano')
                      ) 
                    ElevatedButton(
                      onPressed: () async { 
                        await widget.controller.recalculateRound();
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tournament recalculated!')),
                        );               
                      },
                      child: Text("Recalculate round results")
                    ),                      
                    if (
                      widget.controller.tournament!.started 
                      && 
                      (widget.controller.round == widget.controller.getMaxRound())
                      && 
                      (widget.controller.tournament!.format != 'americano')
                      )
                    ElevatedButton(
                      onPressed: () async { 
                        final result = await showConfirmDialog(
                          context: context,
                          title: 'Randomize round?',                         
                          hintText: 'You can not undo it',
                          confirmButtonText: 'Shuffle!'
                        );       
                        
                        if (result == "sure") {
                          await widget.controller.shuffleRound();             
                        }                    
                        
                      },
                      child: Text("Randomize Current Round")
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        await _syncTournament();
                      },
                      child: Row (
                        children: [
                          Text("Sync tournament"),
                          Icon(
                            Icons.sync,
                          )
                        ],
                      )
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        final result = await showConfirmDialog(
                          context: context,
                          title: 'You sure want to delete it?',                         
                          hintText: 'You can not undo it',
                          confirmButtonText: 'Delete'
                        );

                        if (result == "sure") {
                          await _deleteTournament();                  
                        }    
                      },
                      child: Row (
                        children: [
                          Text("Delete tournament"),
                          Icon(
                            Icons.delete,
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ],           
          );
        }
      ),    
    );
  }
}

