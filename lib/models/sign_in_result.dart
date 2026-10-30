import 'package:mimipadel/models/mimi_user.dart';

class SignInResult {
  final MimiUser? user;
  final String? error;

  SignInResult({this.user, this.error});

  bool get success => user != null;
}