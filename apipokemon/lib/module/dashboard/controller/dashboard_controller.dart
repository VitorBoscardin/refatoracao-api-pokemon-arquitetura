import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:apipokemon/module/dashboard/core/domain/model/pokemon.dart';
import 'package:apipokemon/module/dashboard/core/domain/usecase/listar_pokemon_usecase.dart';
import 'package:apipokemon/module/dashboard/state/dashboard_state.dart';

@injectable
class DashboardController extends Cubit<DashboardState> {
  final ListarPokemonUsecase listarPokemonUsecase;

  DashboardController({
    required this.listarPokemonUsecase,
  }) : super(DashboardInitial()) {
    carregarPokemons(); 
  }

  Future<void> carregarPokemons() async {
    emit(DashboardLoading());
    final pokemons = await listarPokemonUsecase();
    emit(DashboardLoaded(pokemons));
  }
}
