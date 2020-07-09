import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  fetchWorldFinal() async {
    final result = await http.get('https://api.covid19api.com/world/total');
    var results = json.decode(result.body);
    // print(results);
    return results;
  }

  fetchContinentRecords() async {
    final response = await http.get(
        'https://corona.lmao.ninja/v2/continents?yesterday=true&sort=cases');

    var results = json.decode(response.body);

    // print(results);
    return results;
  }

  fetchCountries() async {
    final response = await http
        .get('https://corona.lmao.ninja/v2/countries?yesterday&sort=cases');
    var results = json.decode(response.body);
    return results;
  }

  fetchSpecificCountry(String country) async {
    final response = await http.get(
        'https://corona.lmao.ninja/v2/countries/$country?yesterday=true&strict=true&query');

    if (response.statusCode == 200) {
      var results = json.decode(response.body);

      return results;
    } else {
      throw Exception('Country not found!');
    }
  }
}

// https://corona.lmao.ninja/v2/countries?yesterday&sort=cases

// https://corona.lmao.ninja/v2/continents?yesterday=true&sort=cases
