import 'package:mimipadel/models/tournament.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mimipadel/config/app_config.dart';
import 'package:mimipadel/models/tournament_game.dart';
import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/services/auth.dart';
import 'package:mimipadel/models/player.dart';

final apiUrl = AppConfig.apiUrl;

class ApiService {
  
  final AuthService auth;
  
  ApiService(this.auth);

  Future<bool> addPlayer(String id, String name) async {
    final idToken = await auth.getIdToken();

    if (idToken == null) {
      return false;
    }

    final response = await http.post(
      Uri.parse('$apiUrl/players'),
      headers: {
        'Authorization': 'Bearer $idToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id' : id,
        'user_id' : '',
        'name': name,
      }),
    );

    if (response.statusCode != 201) {
      print('Status: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Body: ${response.body}');
      throw Exception('Failed to insert player');      
    }

    return true;    
  }

  Future<List<Player>> loadPlayers() async {
    final idToken = await auth.getIdToken();
    try {
      http.Response response = await http.get(
        Uri.parse('$apiUrl/players'),
        headers: {
          'Authorization': 'Bearer $idToken',
        }     
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        final players = data
            .map((json) => Player.fromJson(json))
            .toList();
            
        return players;
      }

      throw Exception();

    }
    catch (e) {
      print(e.toString());
      return [];
    }

  }


  Future<List<Tournament>> loadTournaments() async {
    final idToken = await auth.getIdToken();
    try {
      http.Response response = await http.get(
        Uri.parse('$apiUrl/tournaments'),
        headers: {
          'Authorization': 'Bearer $idToken',
        }          
      );
     
      if (response.statusCode == 200) {

        final List data = jsonDecode(response.body);
        final tournaments = data
            .map((json) => Tournament.fromJson(json))
            .toList();
            
        return tournaments;        
      }

      throw Exception();

    }
    catch (e) {
      print(e.toString());
      return [];
    }

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
        'mixer' : tournament.mixer,
        'started' : tournament.started,
        'finished' : tournament.finished,        
        'format': tournament.format,
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

  Future<bool> updateTournament(Tournament tournament) async {

    final idToken = await auth.getIdToken();

    if (idToken == null) {
      return false;
    }

    final response = await http.put(
      Uri.parse('$apiUrl/tournaments/${tournament.id}'),
      headers: {
        'Authorization': 'Bearer $idToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': tournament.name,
        'courts' : tournament.courts,
        'points' : tournament.points,
        'started' : tournament.started,
        'finished' : tournament.finished,
        'mixer' : tournament.mixer,
        // !!! add date after
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update tournament');
    }

    return true;
  }

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

  Future<bool> syncTournament(Tournament tournament, List<TournamentGame> games, List<TournamentPlayer> players) async {
    
    final idToken = await auth.getIdToken();

    if (idToken == null) {
      return false;
    }

    await http.delete(
      Uri.parse('$apiUrl/tournaments/${tournament.id}/games'),
      headers: {
        'Authorization': 'Bearer $idToken',
        'Accept': 'application/json',
      },
    );       

    await http.delete(
      Uri.parse('$apiUrl/tournaments/${tournament.id}/players'),
      headers: {
        'Authorization': 'Bearer $idToken',
        'Accept': 'application/json',
      },
    );    

    final response1 = await http.post(
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
        'mixer' : tournament.mixer,
        'started' : tournament.started,
        'finished' : tournament.finished,
        'format': tournament.format,
      }),
    );      

    if (response1.statusCode == 201) {

      final response2 = await http.post(

          Uri.parse('$apiUrl/tournaments/${tournament.id}/players/bulk'),
          headers: {
            'Authorization': 'Bearer $idToken',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },

          body: jsonEncode({
            'players': players.map((player) => player.toJson()).toList(),
          }),

      );          

      if (response2.statusCode == 200)  {
        final response3 = await http.post(
          Uri.parse('$apiUrl/tournaments/${tournament.id}/games/bulk'),
          headers: {
            'Authorization': 'Bearer $idToken',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },

          body: jsonEncode({
            'games': games.map((game) => game.toJson()).toList(),
          }),

        );    

        if (response3.statusCode == 200) {
          return true;  
        }    
      }


    }

    return false;

  }  

  Future<bool> addTournamentPlayer(String id, String tid, String name, String pid) async {

    final idToken = await auth.getIdToken();

    if (idToken == null) {
      return false;
    }

    final response = await http.post(
      Uri.parse('$apiUrl/tournaments/$tid/players'),
      headers: {
        'Authorization': 'Bearer $idToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        'id' : id,
        'player_id' : pid,
        'name': name,
      }),
    );

    if (response.statusCode != 201) {
      print('Status: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Body: ${response.body}');
      throw Exception('Failed to insert player!');      
    }

    return true;
  }  

  Future<bool> removeTournamentPlayer(String id, String tid) async {

    final idToken = await auth.getIdToken();

    if (idToken == null) {
      return false;
    }

    final response = await http.delete(
      Uri.parse('$apiUrl/tournaments/$tid/players/$id'),
      headers: {
        'Authorization': 'Bearer $idToken',
        'Accept': 'application/json',        
      },
    );

    if (response.statusCode != 200) {
      print('Status: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Body: ${response.body}');
      throw Exception('Failed to delete player!');      
    }

    return true;
  }    

  Future<bool> insertTournamentGames(List<TournamentGame> games, String tid) async {

    final idToken = await auth.getIdToken();

    if (idToken == null) {
      return false;
    }

    final response = await http.post(
      Uri.parse('$apiUrl/tournaments/$tid/games/bulk'),
      headers: {
        'Authorization': 'Bearer $idToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        'games': games.map((game) => game.toJson()).toList(),
      }),
    );

    if (response.statusCode != 200) {
      print('Status: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Body: ${response.body}');
      throw Exception('Failed to insert games!');      
    }

    return true;
  }    


  Future<bool> updateTournamentGame(String id, int side1, int side2, String tid) async {

    final idToken = await auth.getIdToken();

    if (idToken == null) {
      return false;
    }

    final response = await http.put(
      Uri.parse('$apiUrl/tournaments/$tid/games/$id'),
      headers: {
        'Authorization': 'Bearer $idToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'side_1_score': side1,
        'side_2_score' : side2,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update game');
    }

    return true;
  }  
}