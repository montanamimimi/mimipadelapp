class Player {
  final String id;
  String name;
  String? userId;

  Player({
    required this.id,
    required this.name,
    this.userId, 
  });

  @override
  String toString() {
      return 'Player instance, id $id, name $name, user id $userId';
  }

  // factory MimiUser.fromJson(Map<String, dynamic> json) {
  //   return MimiUser(
  //     id: json['id'],
  //     firebaseUid: json['firebase_uid'],
  //     name: json['name'],
  //     email: json['email'],
  //   );
  // }

}