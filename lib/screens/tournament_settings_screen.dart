import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/widget/form_fields/custom_text_form_field.dart';

class TournamentSettingsScreen extends StatefulWidget {
  final int tournamentId;
  final TournamentRepository repository;

  const TournamentSettingsScreen({
    super.key,
    required this.tournamentId,
    required this.repository,
  });

  @override
  State<TournamentSettingsScreen> createState() => _TournamentSettingsScreenState();
}

class _TournamentSettingsScreenState extends State<TournamentSettingsScreen> {
  
  Tournament tournament = Tournament(id: 0, name: "", date: DateTime.now());
  List<TournamentPlayer> players = [];
  final _formKey = GlobalKey<FormState>();
  bool ready = false;

  final TextEditingController _playerController = TextEditingController();

  Future<void> _loadTournament() async {
    final result =
        await widget.repository.getTournamentById(widget.tournamentId);

    if (!mounted) return;

    if (result == null) {
      Navigator.pushReplacementNamed(context, '/');
      return;
    }

    setState(() {
      tournament = result;
    });

    await _loadPlayers();
  }

  Future<void> _loadPlayers() async {

    final result = await widget.repository.getTournamentPlayersById(tournament.id);

    setState(() {
      players = result;
    });

    if (players.length >= tournament.courts*4) {
      setState(() {
        ready = true;
      });
    }    
  }
  
  Future<void> _deleteTournament() async {
    await widget.repository.deleteTournament(tournament.id);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/');
  }

  Future<void> _addPlayer() async {

    if (_playerController.text != "") {
      
      await widget.repository.addPlayer(tournament.id, _playerController.text)
      .then((value) => ScaffoldMessenger(child: Text("???"))
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added a player!')),
      );

      _playerController.text = "";
      await _loadPlayers();
    }
  }

  Future<void> _startTournament() async {
    tournament.started = true;
    await _updateTournament();
    Navigator.popAndPushNamed(context, '/play', arguments: tournament.id);
  }  

  Future<void> _updateTournament() async {
    if (tournament.id != 0) {
      await widget.repository.updateTournament(tournament);
    }
  }  
   
  @override
  void initState() {
    super.initState();
    _loadTournament();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit tournament")
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 12.0,
          children: [
            Text(tournament.name),
            Text("Date: ${tournament.getDate()}"),
            Text("Courts to play: ${tournament.courts}"),
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
                    Text(player.name)
                  ],
                );
              },
            ),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(child: CustomTextFormField(controller: _playerController, label: 'Name')),
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
            Row(
              children: [
                Checkbox(
                  value: tournament.finished,                  
                  onChanged: (value) {
                    setState(() {
                      tournament.finished = value!;
                    });
                  },              
                ),
                Text("Finished?"),
              ]
            ),  
            ElevatedButton(
              onPressed: () async {
                await _updateTournament();
              },
              child: Row (
                children: [
                  Text("Update tournament"),
                  Icon(
                    Icons.save,
                  )
                ],
              )
            ),

            if (ready) 
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
            )
          ],
          )
        ),
    );
  }
}


