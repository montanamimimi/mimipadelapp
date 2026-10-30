import 'package:http/http.dart' as http;
import 'package:mimipadel/config/app_config.dart';

class ConnectivityService {
  Future<bool> checkInternet() async {
    try {
      await http
          .get(Uri.parse(AppConfig.apiUrl))
          .timeout(const Duration(seconds: 3));

      return true;
    } catch (_) {
      return false;
    }
  }
}