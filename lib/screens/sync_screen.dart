import 'package:flutter/material.dart';
// import 'package:mimipadel/widget/player_item.dart';
import 'package:mimipadel/controllers/players_controller.dart';
import 'package:mimipadel/controllers/home_controller.dart';
// import 'package:mimipadel/widget/dialogs/text_input_dialog.dart';

class SyncScreen extends StatefulWidget {

  final PlayersController playersController;
  final HomeController tournamentsController;

  const SyncScreen({
    super.key, 
    required this.playersController,
    required this.tournamentsController,
    });

  @override
  State<SyncScreen> createState() => _SyncScreenState();
}

class _SyncScreenState extends State<SyncScreen> {
  
  // Future<void> _load() async {
  //   await widget.playersController.getPlayers();
    
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  Future<void> _syncPlayers() async {
    await widget.playersController.syncPlayers();
  }  

  Future<void> _syncTournaments() async {
    print('Fire _syncTournaments');
    await widget.tournamentsController.syncTournaments();  
  }    

  // Future<void> _cleanPlayers() async {
  //   await widget.controller.cleanLocalPlayers();
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }  
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
              'Sync',
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
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _syncPlayers,
                child: Text('Sync players'),
              ),
              ElevatedButton(
                onPressed: _syncTournaments,
                child: Text('Sync tournaments'),
              )              
            ],
          )
        ),
      ),    
    );
  }
}