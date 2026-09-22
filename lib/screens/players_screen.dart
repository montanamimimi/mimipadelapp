import 'package:flutter/material.dart';
import 'package:mimipadel/widget/player_item.dart';
import 'package:mimipadel/controllers/players_controller.dart';
import 'package:mimipadel/widget/dialogs/text_input_dialog.dart';

class PlayersScreen extends StatefulWidget {

  final PlayersController controller;

  const PlayersScreen({super.key, required this.controller});

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  
  Future<void> _load() async {
    await widget.controller.getPlayers();
    
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _cleanPlayers() async {
    await widget.controller.cleanLocalPlayers();
  }

  @override
  void initState() {
    super.initState();   
    _load();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
                'Players list',
                style: TextStyle(                
                fontFamily: 'IndieFlower'
              ),              
            ),
          elevation: 2.0,
          shadowColor: Colors.black,                
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0),
            child: ListenableBuilder(
              listenable: widget.controller, 
              builder: (context, child) {
                return ListView(
                  children: [
                    ElevatedButton(
                      onPressed: _cleanPlayers,
                      child: Text('Clean Local Players'),
                    ),
                    ...widget.controller.players.map(
                      (player) => PlayerItem(
                          name: player.name,
                          rating: 0,
                        ),
                    ),                                                                                                                                                                   
                  ],
                );
              }
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(          
          onPressed: () async {
            final name = await showTextInputDialog(
              context: context,
              title: 'Add Player',
              initialValue: '',
              hintText: 'Player name',
            );

            if (name != null && name.isNotEmpty) {
              widget.controller.addPlayer(name);                       
            }                      
          },
          child: Icon(
            Icons.add,
            size: 50.0,
          ),
        ),        
      );
  }
}