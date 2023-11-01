import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon_repository.dart';
import '../model/pokemons.dart';

class HomeController extends ChangeNotifier {
  final PokemonRepository repository;

  List<Pokemon> pokemonList = [];

  HomeController({required this.repository});

  void load() {
    repository.loadPokemons().then((list) {
      pokemonList = list;
      notifyListeners();
    });
  }
}
