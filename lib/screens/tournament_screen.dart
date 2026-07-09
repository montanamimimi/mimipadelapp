import 'package:mimipadel/enums/tournament_screen_mode.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/views/create_tournament_view.dart';
import 'package:mimipadel/views/edit_tournament_view.dart';
import 'package:mimipadel/views/play_tournament_view.dart';
import 'package:mimipadel/views/results_tournament_view.dart';
import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:mimipadel/views/settings_tournament_view.dart';

class TournamentScreen extends StatefulWidget {
  final int tournamentId;
  final TournamentController controller;
  final TournamentScreenMode mode;

  const TournamentScreen({
    super.key,
    required this.tournamentId,
    required this.controller,
    required this.mode,
  });

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  
  late final TournamentController controller;
  TournamentScreenMode mode = TournamentScreenMode.create;
  bool isLoading = true;
  
  Future<void> _loadTournament(int? id) async { 
    if (id != null) {
      await controller.load(id);
    } else {
      await controller.load(widget.tournamentId);
    }

    if (!mounted) return;

    if (controller.tournament == null) {
      Navigator.pushReplacementNamed(context, '/');
      return;
    }

    setState(() {         
      isLoading = false;
    });
  }

  Future<void> _nextRound() async {
    await controller.nextRound();    
  }
  Future<void> _prevRound() async {
    await controller.prevRound();
  }  

  @override
  void initState() {
    super.initState();    
    controller = widget.controller;

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
          controller: controller,
          onCreate: (id) async {
            await _loadTournament(id);
            setState(() {              
              mode = TournamentScreenMode.edit;
            });
          }
        );

      case TournamentScreenMode.edit:
       
        return EditTournamentView(
            controller: controller,
            onStart: () {              
              setState(() {
                mode = TournamentScreenMode.play;
              });
            }
          );
        
      case TournamentScreenMode.play:
        return PlayTournamentView(
          controller: controller,
          onNextRound: () async {
            await _nextRound();
          },
          onPrevRound: () async {
            await _prevRound();
          }
        );

      case TournamentScreenMode.results:
        return ResultsTournamentView(
          controller: controller,
        );
      case TournamentScreenMode.settings:
        return SettingsTournamentView(
          controller: controller,
        );      
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                        
        title: mode == TournamentScreenMode.create
        ? const Text('Create tournament')
        : Text(controller.tournament?.name ?? 'Loading...'),
        
        centerTitle: true,
        actions: [
          if (mode == TournamentScreenMode.play)
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
                mode = TournamentScreenMode.play;
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
              Icons.person
            ),
            label: 'Results'
          ),
        ],
      ) : null,
    );
  }
}