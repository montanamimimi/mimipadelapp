import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:flutter/material.dart';
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
  
  final _formKey = GlobalKey<FormState>();
  final _playerFocusNode = FocusNode();
  final TextEditingController _playerController = TextEditingController();


  @override
  void dispose() {
    _playerFocusNode.dispose();
    _playerController.dispose();
    super.dispose();
  }

  Future<void> _addPlayer() async {    
    if (!_formKey.currentState!.validate()) return;
    await widget.controller.addPlayer(_playerController.text);
    _playerController.clear();
    _playerFocusNode.requestFocus();
  }

  Future<void> _removePlayer(int id) async {
    await widget.controller.removePlayer(id);

  }  

  Future<void> _startTournament() async {
    await widget.controller.startTournament();   
    widget.onStart();
  }  

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListenableBuilder(
      listenable: widget.controller, 
      builder: (context, child) {
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
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(child: CustomTextFormField(
                    controller: _playerController, 
                    label: 'Name',
                    required: true,
                    callback: _addPlayer,
                    focusNode: _playerFocusNode,
                  )),
                  IconButton(
                    onPressed: _addPlayer,
                    icon: Icon(Icons.add)
                  )
                ]
              ),
            ),  
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
                              _removePlayer(player.id);
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

