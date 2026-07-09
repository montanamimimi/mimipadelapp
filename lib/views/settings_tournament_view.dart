import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:flutter/material.dart';

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

    // ADD ARE YOU SURE HERE 

    await widget.controller.delete();
    if (!mounted) return;
    Navigator.pop(context, true);
  }

  // Make it universal to rename players also 

  void showNameDialog(BuildContext context) {
    
    final textController = TextEditingController(
      text: widget.controller.tournament!.name
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Rename tournament"),
          content: TextField(            
            controller: textController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Tournament name',
            ),
          ),
          actions: [            
            TextButton(
              onPressed: () {                
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                widget.controller.updateName(textController.text);
                if (!context.mounted) return;

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
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
                    onPressed: () {
                      showNameDialog(context);
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
                            Text('${(index + 1).toString()}.'),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(player.name),
                          ],
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () { 
                        print(widget.controller.tournament);                    
                      }, 
                      child: Text("Debug Print tournament data")
                    ),                
                    ElevatedButton(
                      onPressed: () async {
                        await _deleteTournament();
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

