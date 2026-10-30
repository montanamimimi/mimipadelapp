class TournamentPlayer {
  final String id;
  final String tournamentId;
  String name;
  final String? playerId;

  TournamentPlayer({
    required this.id,
    required this.tournamentId,
    required this.name, 
    this.playerId,
    });

  @override
  String toString() {
    return 'Player(id: $id, playerId: $playerId, name: $name, tournament: $tournamentId)';
  }

  TournamentPlayer copyWith({
    String? id,
    String? tournamentId,
    String? name,
    String? playerId,
  }) {
    return TournamentPlayer(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      name: name ?? this.name,
      playerId: playerId ?? this.playerId,
    );
  } 

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'tournament_id': tournamentId,
      'name': name,
      'player_id': playerId,
    };
  }    
}