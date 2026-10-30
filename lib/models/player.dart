class Player {
  final String id;
  String name;
  String? userId;
  bool archived;

  Player({
    required this.id,
    required this.name,
    this.userId,
    this.archived = false,
  });

  @override
  String toString() {
      return 'Player instance, id $id, name $name, user id $userId';
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      archived: json['archived'] == 1,
    );
  }

}