import 'package:flutter/material.dart';
import '../model/pokemons.dart';

class PokemonDetailsPage extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonDetailsPage({super.key, required this.pokemon});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  List<Pokemon> pokemonsList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topCenter,
          height: 600,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 4, offset: const Offset(3, 3))
          ]),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
                  width: 400,
                  height: 250,
                  child: Image.network(widget.pokemon.thumbnailImage ?? ''),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(
                      widget.pokemon.description ?? '',
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Tipo:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.pokemon.type?.join(', ') ?? '',
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Fraquezas:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(widget.pokemon.weakness?.join('  ') ?? ''),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
