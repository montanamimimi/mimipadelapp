class TournamentGame {
  final String id;
  final String tournamentId;
  final int round;  
  String side1Player1Id;
  String side1Player2Id;
  String side2Player1Id;
  String side2Player2Id;
  int side1Score;
  int side2Score;
  

  TournamentGame({
    required this.id,
    required this.tournamentId,
    required this.round,
    required this.side1Player1Id,
    required this.side1Player2Id,
    required this.side2Player1Id,
    required this.side2Player2Id,
    required this.side1Score,
    required this.side2Score,
    });

  @override
  String toString() {
      return 'Game id: $id, round: $round, side1Score: $side1Score, side2Score: $side2Score, p1: $side1Player1Id, p2: $side1Player2Id, p3: $side2Player1Id, p4: $side2Player2Id';
  }    

  TournamentGame copyWith({
    String? id,
    String? tournamentId,
    int? round,
    String? side1Player1Id,
    String? side1Player2Id,
    String? side2Player1Id,
    String? side2Player2Id,
    int? side1Score,
    int? side2Score,
  }) {
    return TournamentGame(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      round: round ?? this.round,
      side1Player1Id: side1Player1Id ?? this.side1Player1Id,
      side1Player2Id: side1Player2Id ?? this.side1Player2Id,
      side2Player1Id: side2Player1Id ?? this.side2Player1Id,
      side2Player2Id: side2Player2Id ?? this.side2Player2Id,
      side1Score: side1Score ?? this.side1Score,
      side2Score: side2Score ?? this.side2Score,
    );
  } 


  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'tournament_id': tournamentId,
      'round': round,
      'side1_player1_id': side1Player1Id,
      'side1_player2_id': side1Player2Id,
      'side2_player1_id': side2Player1Id,
      'side2_player2_id': side2Player2Id,
      'side_1_score': side1Score,
      'side_2_score' : side2Score,
    };
  }  

}