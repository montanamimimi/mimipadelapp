class TournamentGame {
  int id;
  int tournamentId;
  int gameNumber;  
  int side1Player1Id;
  int side1Player2Id;
  int side2Player1Id;
  int side2Player2Id;
  int side1Score;
  int side2Score;
  

  TournamentGame({
    required this.id,
    required this.tournamentId,
    required this.gameNumber,
    required this.side1Player1Id,
    required this.side1Player2Id,
    required this.side2Player1Id,
    required this.side2Player2Id,
    required this.side1Score,
    required this.side2Score,
    });

  @override
  String toString() {
      return 'Game (\n'
      '  id: $id,\n'
      '  tournamentId: $tournamentId,\n'      
      '  roundNumber: $gameNumber,\n'
      '  side1Score: $side1Score,\n'
      '  side2Score: $side2Score\n'
      ')';
  }    

  TournamentGame copyWith({
    int? id,
    int? tournamentId,
    int? gameNumber,
    int? side1Player1Id,
    int? side1Player2Id,
    int? side2Player1Id,
    int? side2Player2Id,
    int? side1Score,
    int? side2Score,
  }) {
    return TournamentGame(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      gameNumber: gameNumber ?? this.gameNumber,
      side1Player1Id: side1Player1Id ?? this.side1Player1Id,
      side1Player2Id: side1Player2Id ?? this.side1Player2Id,
      side2Player1Id: side2Player1Id ?? this.side2Player1Id,
      side2Player2Id: side2Player2Id ?? this.side2Player2Id,
      side1Score: side1Score ?? this.side1Score,
      side2Score: side2Score ?? this.side2Score,
    );
  } 
}