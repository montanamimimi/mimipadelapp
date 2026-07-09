class TournamentPlayer {
  int id;
  int tournamentId;
  String name;

  TournamentPlayer({
    required this.id,
    required this.name, 
    required this.tournamentId,
    });

  @override
  String toString() {
    return 'Player(id: $id, name: $name, tournament: $tournamentId)';
  }

  TournamentPlayer copyWith({
    int? id,
    int? tournamentId,
    String? name,
  }) {
    return TournamentPlayer(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      name: name ?? this.name,
    );
  } 
}