import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemons.dart';

class FavsRepository extends ChangeNotifier {
  final List<Pokemon> _lista = [];

  UnmodifiableListView<Pokemon> get lista => UnmodifiableListView(_lista);

  saveAll(List<Pokemon> pokemons) {
    pokemons.forEach((pokemon) {
      if (!_lista.contains(pokemon)) _lista.add(pokemon);
    });
    notifyListeners();
  }

  remove(Pokemon pokemon) {
    _lista.remove(pokemon);
    notifyListeners();
  }
}
