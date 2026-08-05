class MimiUser {
  final String id;
  String firebaseUid;
  String? name;
  String? email;
  String? avaUrl;

  MimiUser({
    required this.id,
    required this.firebaseUid,
    this.name,
    this.email, 
    this.avaUrl,
  });

  @override
  String toString() {
      return 'User instance firebase_uid $firebaseUid';
  }

  factory MimiUser.fromJson(Map<String, dynamic> json) {
    return MimiUser(
      id: json['id'],
      firebaseUid: json['firebase_uid'],
      name: json['name'],
      email: json['email'],
    );
  }

}