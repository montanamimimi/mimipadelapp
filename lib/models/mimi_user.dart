class MimiUser {
  final String uuid;

  MimiUser({
    required this.uuid
  });

  @override
  String toString() {
      return 'User instance ou uuid $uuid';
  }     
}