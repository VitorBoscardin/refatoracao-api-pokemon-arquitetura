import 'package:apipokemon/module/dashboard/core/domain/model/pokemon.dart';

abstract class ListarPokemonRepository {
  Future<List<Pokemon>> call();
}
