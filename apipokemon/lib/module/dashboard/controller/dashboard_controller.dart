import 'package:apipokemon/module/dashboard/core/domain/model/pokemon.dart';
import 'package:apipokemon/module/dashboard/core/domain/usecase/listar_pokemon_usecase.dart';

class DashboardController {
  final ListarPokemonUsecase _listarUsecase;

  List<Pokemon> pokemons = [];

  DashboardController(this._listarUsecase);

  Future<void> carregarPokemons() async {
    pokemons = await _listarUsecase();
  }
}
