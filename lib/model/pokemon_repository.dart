import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/model/pokemons.dart';

class PokemonRepository {

  Future<List<Pokemon>> loadPokemons() {
    var uri = Uri.parse('https://rafaelbarbosatec.github.io/api/pokemon/pokemons.json');
    return http.get(uri).then((value) {
      if (value.statusCode == 200) {
        Map json = jsonDecode(value.body);
        List data = json['data'];
        return data.map((e) {
          return Pokemon.fromJson(e);
        }).toList();
      }
      return Future.value([]);
    });
  }
}
