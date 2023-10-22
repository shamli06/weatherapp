import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class Repository{

  Future<Weather> fetchWeather() async {
    String apiId = "60a7bba09310b718ada33214a71ad2a7";
    final response = await http
        .get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=Mumbai&appid=$apiId&units=metric'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Weather.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
}