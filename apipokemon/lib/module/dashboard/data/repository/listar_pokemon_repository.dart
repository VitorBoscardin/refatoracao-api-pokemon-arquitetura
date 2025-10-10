import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:apipokemon/module/dashboard/core/domain/model/pokemon.dart';
import 'package:apipokemon/module/dashboard/core/domain/contract/listar_pokemon_repository.dart';

@Injectable(as: ListarPokemonRepository)
class ListarPokemonRepositoryImpl implements ListarPokemonRepository {
  @override
  Future<List<Pokemon>> call() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List;

     
      return Future.wait(results.map((item) async {
        final detailResponse = await http.get(Uri.parse(item['url']));
        final detailData = jsonDecode(detailResponse.body);
        return Pokemon.fromMap(detailData);
      }).toList());
    } else {
      throw Exception('Erro ao carregar Pokémons');
    }
  }
}
