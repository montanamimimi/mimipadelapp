class TournamentStanding {
  final int playerId;
  final String playerName;
  int score = 0;
  int win = 0;
  int lose = 0;
  int tie = 0;
  int diff = 0;

  TournamentStanding({
    required this.playerId,
    required this.playerName,
    this.score = 0,
    this.win = 0,
    this.lose = 0,
    this.tie = 0, 
    this.diff = 0,
  });

  @override
  String toString() {
    return 'Standing(player id: $playerId, name: $playerName, score: $score, win: $win, lose: $lose, tie: $tie)';
  }  
}