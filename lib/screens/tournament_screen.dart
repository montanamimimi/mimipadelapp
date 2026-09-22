import 'package:mimipadel/controllers/players_controller.dart';
import 'package:mimipadel/enums/tournament_screen_mode.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament_format.dart';
import 'package:mimipadel/views/create_tournament_view.dart';
import 'package:mimipadel/views/edit_tournament_view.dart';
import 'package:mimipadel/views/play_tournament_view.dart';
import 'package:mimipadel/views/results_tournament_view.dart';
import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:mimipadel/views/settings_tournament_view.dart';

class TournamentScreen extends StatefulWidget {
  final String tournamentId;
  final TournamentController controller;
  final PlayersController playersController;
  final TournamentScreenMode mode;
  final TournamentFormat format;

  const TournamentScreen({
    super.key,
    required this.tournamentId,
    required this.playersController,
    required this.controller,
    required this.mode,
    required this.format,
  });

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  
//  late final TournamentController controller;
  TournamentScreenMode mode = TournamentScreenMode.create;
  bool isLoading = true;
  
  Future<void> _loadTournament(String? id) async { 
    if (id != null) {
      await widget.controller.load(id);
    } else {
      await widget.controller.load(widget.tournamentId);
    }

    if (!mounted) return;

    if (widget.controller.tournament == null) {
      Navigator.pushReplacementNamed(context, '/');
      return;
    }

    setState(() {         
      isLoading = false;
    });
  }

  Future<void> _nextRound() async {
    await widget.controller.nextRound();    
  }
  Future<void> _prevRound() async {
    await widget.controller.prevRound();
  }  

  @override
  void initState() {
    super.initState();    
    // controller = widget.controller;

    mode = widget.mode;

    if (!(mode == TournamentScreenMode.create)) {
      _loadTournament(null);      
    } else {
      isLoading = false;      
    }
  }

  Widget buildBody() {

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    switch (mode) {

      case TournamentScreenMode.create:       
        return CreateTournamentView(
          controller: widget.controller,
          onCreate: (id) async {
            await _loadTournament(id);
            setState(() {              
              mode = TournamentScreenMode.edit;
            });
          },
          format: widget.format,
        );

      case TournamentScreenMode.edit:
       
        return EditTournamentView(
            controller: widget.controller,
            playersController: widget.playersController,
            onStart: () {              
              setState(() {
                mode = TournamentScreenMode.play;
              });
            }
          );
        
      case TournamentScreenMode.play:
        return PlayTournamentView(
          controller: widget.controller,
          onNextRound: () async {
            await _nextRound();
          },
          onPrevRound: () async {
            await _prevRound();
          }
        );

      case TournamentScreenMode.results:
        return ResultsTournamentView(
          controller: widget.controller,
        );
      case TournamentScreenMode.settings:
        return SettingsTournamentView(
          controller: widget.controller,
        );      
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image(
              image: AssetImage('assets/images/mimi_logo_xs.png'),
              width: 40.0,
              height: 40.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            if (mode == TournamentScreenMode.create)
            const Text('Create tournament')
            else
            Text(widget.controller.tournament?.name ?? 'Loading...'),
          ]
        ),
        elevation: 2.0,
        shadowColor: Colors.black,
        actions: [
          if ((mode == TournamentScreenMode.play) || (mode == TournamentScreenMode.edit))
          IconButton(
            onPressed: () {              
              setState(() {
                mode = TournamentScreenMode.settings;
              });
            }, 
            icon: Icon(Icons.settings),
          ),
          if (mode == TournamentScreenMode.settings)
          IconButton(
            onPressed: () {              
              setState(() {
                if (widget.controller.tournament!.started) {
                  mode = TournamentScreenMode.play;
                } else {
                  mode = TournamentScreenMode.edit;
                }                
              });
            }, 
            icon: Icon(Icons.save),
          )
        ],  
        automaticallyImplyLeading: false,

        leading: (mode == TournamentScreenMode.settings)
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
      ),
      body: buildBody(),
      bottomNavigationBar: ((mode == TournamentScreenMode.play) || (mode == TournamentScreenMode.results))
      ? BottomNavigationBar(         
        onTap: (index) {

          if (index == 0) {
            setState(() {
              mode = TournamentScreenMode.play;
            });
          }

          if (index == 1) {
            setState(() {
              mode = TournamentScreenMode.results;
            });            
          }

        },        
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.games
            ),
            label: 'Play',              
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_events_rounded
            ),
            label: 'Results'
          ),
        ],
      ) : null,
    );
  }
}