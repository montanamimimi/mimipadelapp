import 'package:flutter/material.dart';
import 'package:mimipadel/controllers/home_controller.dart';
import 'package:mimipadel/widget/tournament_item.dart';

class TournamentList extends StatelessWidget {
  
  const TournamentList({
    super.key, 
    required this.controller,
    required this.callback,
    });

  final HomeController controller;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: controller.tournaments.map((t) {
        return TournamentItem(
          tournament: t,
          callback: callback,
          );
      }).toList(),
    );
  }
}
