import 'package:apipokemon/module/dashboard/data/repository/listar_pokemon_repository.dart';
import 'package:apipokemon/module/dashboard/core/domain/model/pokemon.dart';

class ListarPokemonUsecase {
  final ListarPokemonRepository repository;

  ListarPokemonUsecase(this.repository);

  Future<List<Pokemon>> call() async {
    return await repository.fetchPokemons();
  }
}
