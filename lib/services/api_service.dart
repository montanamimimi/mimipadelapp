import 'package:mimipadel/models/tournament.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mimipadel/config/app_config.dart';
import 'package:mimipadel/services/auth.dart';

final apiUrl = AppConfig.apiUrl;

class ApiService {
  
  final AuthService auth;
  
  ApiService(this.auth);

  Future<bool> createTournament(Tournament tournament) async {
    
    final idToken = await auth.getIdToken();

    if (idToken == null) {
      return false;
    }

    final response = await http.post(
      Uri.parse('$apiUrl/tournaments'),
      headers: {
        'Authorization': 'Bearer $idToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id' : tournament.id,
        'name': tournament.name,
        'date': tournament.date.toIso8601String().substring(0, 10),
        'courts': tournament.courts,
        'points': tournament.points,
      }),
    );

    if (response.statusCode != 201) {
      print('Status: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Body: ${response.body}');
      throw Exception('Failed to insert tournament');      
    }

    return true;
  }

  // Future<List<Tournament>> loadTournaments() async {

  //   try {
  //     http.Response response = await http.get(Uri.parse('$apiUrl/tournaments'));

  //     if (response.statusCode == 200) {
  //       final List data = jsonDecode(response.body);

  //       final tournaments = data
  //           .map((json) => Tournament.fromJson(json))
  //           .toList();

  //       return tournaments;
  //     }

  //     throw Exception();

  //   }
  //   catch (e) {
  //     return localStorageService.getTournaments();
  //   }

  // }


  // Future<Tournament> updateTournament(Tournament tournament) async {
  //   final response = await http.put(
  //     Uri.parse('$apiUrl/tournaments/${tournament.id}'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'X-API-PASSWORD': apiPass,
  //     },
  //     body: jsonEncode({
  //       'name': tournament.name,
  //       'courts' : tournament.courts,
  //     }),
  //   );

  //   if (response.statusCode != 201) {
  //     throw Exception('Failed to update tournament');
  //   }

  //   final data = jsonDecode(response.body);

  //   return Tournament.fromJson(data);
  // }

  Future<bool> deleteTournament(String id) async {
    
    final idToken = await auth.getIdToken();

    if (idToken == null) {
      return false;
    }

    final response = await http.delete(
      Uri.parse('$apiUrl/tournaments/$id'),
      headers: {
        'Authorization': 'Bearer $idToken',
        'Accept': 'application/json',        
      },
    );

    if (response.statusCode != 200) {
      print('Status: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Body: ${response.body}');
      throw Exception('Failed to delete tournament');      
    }    

    return true;

  }
}