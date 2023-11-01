import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon_repository.dart';
import 'package:pokedex_app/presenter/home_controller.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _controller;

  @override
  void initState() {
    _controller = HomeController(
      repository: PokemonRepository(),
    );
    _controller.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network('https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png'),
          ),
        ],
        title: const Text('Pokedex'),
      ),
      body: ListenableBuilder(
          listenable: _controller,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: _controller.pokemonList.length,
                itemBuilder: (context, index) {
                  var name = _controller.pokemonList[index].name;
                  String? image = _controller.pokemonList[index].thumbnailImage;
                  var id = _controller.pokemonList[index].number;
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            return PokemonDetailsPage(
                              pokemon: _controller.pokemonList[index],
                            );
                          }));
                        });
                      },
                      child: Card(
                        child: ListTile(
                          leading: Image.network(image!),
                          title: Text(name.toString()),
                          trailing: Text('#$id'),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
