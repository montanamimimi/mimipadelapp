import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/widget/dialogs/text_input_dialog.dart';
import 'package:mimipadel/widget/dialogs/confirm_dialog.dart';

class SettingsTournamentView extends StatefulWidget {

  final TournamentController controller;

  const SettingsTournamentView({
    super.key,
    required this.controller,
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
              
              Text("Date: ${widget.controller.tournament!.getDate()}"),
              Text("Courts to play: ${widget.controller.tournament!.courts}"),
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
                    onPressed: () {
                      // EDIT POINTS TO PLAY HERE
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
                               
                                final name = await showTextInputDialog(
                                context: context,
                                title: 'Rename player',
                                initialValue: entry.value.name,                           
                                );

                                if (name != null && name.isNotEmpty) {
                                  widget.controller.updatePlayerName(entry.value.id, name);                       
                                }   
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
                    // ElevatedButton(
                    //   onPressed: () { 
                    //     print(widget.controller.tournament);                    
                    //   }, 
                    //   child: Text("Debug Print tournament data")
                    // ),
                    if((widget.controller.round) > 0 && (widget.controller.round == widget.controller.getMaxRound())) 
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
                    if (widget.controller.tournament!.started && (widget.controller.round == widget.controller.getMaxRound()))
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

