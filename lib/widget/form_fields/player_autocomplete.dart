import 'package:flutter/material.dart';
import 'package:mimipadel/models/player.dart';
import 'package:mimipadel/controllers/players_controller.dart';
import 'package:mimipadel/models/tournament_player.dart';

class PlayerAutocomplete extends StatefulWidget {
  final PlayersController playersController;
  final Function(Player?, String) onSubmit;
  final List<TournamentPlayer> tournamentPlayers;

  const PlayerAutocomplete({
    super.key,
    required this.playersController,
    required this.onSubmit,
    required this.tournamentPlayers,
  });

  @override
  State<PlayerAutocomplete> createState() => _PlayerAutocompleteState();
}

class _PlayerAutocompleteState extends State<PlayerAutocomplete> {
  TextEditingController? _textController;

  void _submit(Player? player, String name) {
    if (name.trim().isEmpty) return;

    widget.onSubmit(player, name.trim());
    _textController?.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Player>(
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<Player>.empty();
        }

        return widget.playersController
            .availablePlayers(widget.tournamentPlayers)
            .where((player) {
          return player.name.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          );
        });
      },

      displayStringForOption: (player) => player.name,

      onSelected: (player) {
        _submit(player, player.name);
      },

      fieldViewBuilder: (
        context,
        textController,
        focusNode,
        onFieldSubmitted,
      ) {
        _textController = textController;

        return Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: textController,
                focusNode: focusNode,
                decoration: const InputDecoration(
                  labelText: 'Player name',
                  hintText: 'Start typing...',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _submit(null, textController.text);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}