import 'package:apipokemon/module/dashboard/controller/dashboard_controller.dart';
import 'package:apipokemon/module/dashboard/core/domain/usecase/listar_pokemon_usecase.dart';
import 'package:apipokemon/module/dashboard/data/repository/listar_pokemon_repository.dart';

class DashboardControllerDi {
  static DashboardController build() {
    final listarRepo = ListarPokemonRepository();
    final listarUsecase = ListarPokemonUsecase(listarRepo);

    return DashboardController(listarUsecase);
  }
}
