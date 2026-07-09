import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/widget/form_fields/custom_text_form_field.dart';

class EditTournamentView extends StatefulWidget {

  final TournamentController controller;
  final VoidCallback onStart;

  const EditTournamentView({
    super.key,
    required this.controller,
    required this.onStart,
  });

  @override
  State<EditTournamentView> createState() => _EditTournamentViewState();
}

class _EditTournamentViewState extends State<EditTournamentView> {
  
  late final TournamentController controller;  
  late final Tournament? tournament;
  List<TournamentPlayer> players = [];
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _playerController = TextEditingController();
  
  Future<void> _deleteTournament() async {
    await controller.delete();
    if (!mounted) return;
    Navigator.pop(context, true);
  }

  Future<void> _addPlayer() async {

    if (_playerController.text != "") {
      
      await controller.addPlayer(_playerController.text);

      if (!mounted) return;

      _playerController.text = "";
      setState(() {
        players = controller.players;
      });
    }
  }

  Future<void> _removePlayer(int id) async {

    await controller.removePlayer(id);

    if (!mounted) return;

    _playerController.text = "";
    setState(() {
      players = controller.players;
    });
  }  

  Future<void> _startTournament() async {
    await controller.startTournament();   
    widget.onStart();
  }  

  @override
  void initState() {
    super.initState();
    tournament = widget.controller.tournament;
    controller = widget.controller;
    players = widget.controller.players;
  }

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(tournament!.name),
          Text("Date: ${tournament!.getDate()}"),
          Text("Courts to play: ${tournament!.courts}"),
          Expanded(
            child: ListView(
              children: [
                ...players.asMap().entries.map(
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
                            _removePlayer(player.id);
                          },
                          icon: Icon(Icons.remove)
                        )
                      ],
                    );
                  },
                ),
                Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Expanded(child: CustomTextFormField(
                        controller: _playerController, 
                        label: 'Name',
                        required: true,
                        callback: () async {
                          if (!_formKey.currentState!.validate()) return;
                          await _addPlayer();
                        },
                      )),
                      IconButton(
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          await _addPlayer();
                        },
                        icon: Icon(Icons.add)
                      )
                    ]
                  ),
                ),
            
                if (controller.gameReady) 
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
              ],
            ),
          ),
          // ElevatedButton(
          //   onPressed: () async {
          //     await _deleteTournament();
          //   },
          //   child: Row (
          //     children: [
          //       Text("Delete tournament"),
          //       Icon(
          //         Icons.delete,
          //       )
          //     ],
          //   )
          // )
        ],
           
      ),
      
      );
  }
}

