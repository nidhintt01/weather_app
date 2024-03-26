import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  //open weather API
  final weatherApiKey = dotenv.env['weatherApiKey'];
  final unit = "&units=metric";
  final baseHourlyUrl = dotenv.env['baseHourlyUrl'];
  final baseWeatherUrl = dotenv.env['baseWeatherUrl'];

  // Google Places API
  final baseMapUrl = dotenv.env['baseMapUrl'];
  final basePlaceUrl = dotenv.env['basePlaceUrl'];
  final mapApiKey = dotenv.env['mapApiKey'];
}
