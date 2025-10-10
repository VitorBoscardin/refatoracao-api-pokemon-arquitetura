import 'package:injectable/injectable.dart';
import 'package:apipokemon/module/dashboard/core/domain/model/pokemon.dart';
import 'package:apipokemon/module/dashboard/core/domain/contract/listar_pokemon_repository.dart';

@injectable
class ListarPokemonUsecase {
  final ListarPokemonRepository listarPokemonRepository;

  ListarPokemonUsecase({required this.listarPokemonRepository});

  Future<List<Pokemon>> call() async {
    return await listarPokemonRepository();
  }
}
