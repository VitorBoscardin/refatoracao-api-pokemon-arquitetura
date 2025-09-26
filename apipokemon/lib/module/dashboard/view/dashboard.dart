import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<dynamic> _allPokemons = [];
  List<dynamic> _filteredPokemons = [];
  bool _isLoading = true;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchPokemons();
    _controller.addListener(_filterPokemons);
  }

  Future<void> fetchPokemons() async {
    final response = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=151"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _allPokemons = data['results'];
        _filteredPokemons = _allPokemons;
        _isLoading = false;
      });
    }
  }

  void _filterPokemons() {
    final query = _controller.text.toLowerCase();
    setState(() {
      _filteredPokemons = _allPokemons
          .where((pokemon) => pokemon['name'].toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex simples'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Pesquisar Pokémon",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredPokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = _filteredPokemons[index];
                      return ListTile(
                        title: Text(pokemon['name']),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
