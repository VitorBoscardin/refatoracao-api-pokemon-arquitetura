import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    home: PokemonListScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List pokemons = [];
  List pokemonsFiltrados = [];

  @override
  void initState() {
    super.initState();
    carregarPokemons();
  }

  void carregarPokemons() async {
    final resposta = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=10"));
    if (resposta.statusCode == 200) {
      final dados = json.decode(resposta.body);
      setState(() {
        pokemons = dados["results"];
        pokemonsFiltrados = pokemons;
      });
    }
  }

  void filtrarPokemons(String texto) {
    texto = texto.toLowerCase();
    setState(() {
      pokemonsFiltrados = pokemons.where((pokemon) {
        return pokemon["name"].toLowerCase().contains(texto);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokédex simples")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filtrarPokemons,
              decoration: const InputDecoration(
                labelText: 'Buscar Pokémon',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: pokemonsFiltrados.isEmpty
                ? const Center(child: Text("Nenhum Pokémon encontrado"))
                : ListView.builder(
                    itemCount: pokemonsFiltrados.length,
                    itemBuilder: (context, index) {
                      final pokemon = pokemonsFiltrados[index];
                      final numero = pokemons.indexOf(pokemon) + 1;
                      final imagem =
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$numero.png";

                      return ListTile(
                        leading: Image.network(imagem),
                        title: Text(pokemon["name"][0].toUpperCase() +
                            pokemon["name"].substring(1)),
                        subtitle: Text("#$numero"),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}