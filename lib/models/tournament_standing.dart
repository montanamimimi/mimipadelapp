class TournamentStanding {
  final int playerId;
  final String playerName;
  int score = 0;

  TournamentStanding({
    required this.playerId,
    required this.playerName,
    this.score = 0,
  });

  @override
  String toString() {
    return 'Standing(player id: $playerId, name: $playerName, score: $score)';
  }  
}