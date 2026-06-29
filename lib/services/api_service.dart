// import 'package:mimipadel/models/tournament.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:mimipadel/services/local_storage_service.dart';

// final apiUrl = 'http://127.0.0.1:8000/api';
// final apiPass = 'test';

// class ApiService {

//   final LocalStorageService localStorageService;

//   ApiService(this.localStorageService);

//   Future<List<Tournament>> loadTournaments() async {

//     try {
//       http.Response response = await http.get(Uri.parse('$apiUrl/tournaments'));

//       if (response.statusCode == 200) {
//         final List data = jsonDecode(response.body);

//         final tournaments = data
//             .map((json) => Tournament.fromJson(json))
//             .toList();

//         return tournaments;
//       }

//       throw Exception();

//     }
//     catch (e) {
//       return localStorageService.getTournaments();
//     }

//   }

//   Future<Tournament> createTournament(Tournament tournament) async {

//     final response = await http.post(
//       Uri.parse('$apiUrl/tournaments'),
//       headers: {
//         'Content-Type': 'application/json',
//         'X-API-PASSWORD': apiPass,
//       },
//       body: jsonEncode({
//         'name': tournament.name,
//       }),
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Failed to create tournament');
//     }

//     final data = jsonDecode(response.body);


//     return Tournament.fromJson(data);
//   }

//   Future<Tournament> updateTournament(Tournament tournament) async {
//     final response = await http.put(
//       Uri.parse('$apiUrl/tournaments/${tournament.id}'),
//       headers: {
//         'Content-Type': 'application/json',
//         'X-API-PASSWORD': apiPass,
//       },
//       body: jsonEncode({
//         'name': tournament.name,
//         'courts' : tournament.courts,
//       }),
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Failed to update tournament');
//     }

//     final data = jsonDecode(response.body);

//     return Tournament.fromJson(data);
//   }

//   Future<void> deleteTournament(int id) async {
//     final response = await http.put(
//       Uri.parse('$apiUrl/tournaments/$id'),
//       headers: {
//         'Content-Type': 'application/json',
//         'X-API-PASSWORD': apiPass,
//       },      
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Failed to delete tournament');
//     }
//   }
// }