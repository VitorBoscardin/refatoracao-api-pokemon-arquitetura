import 'package:apipokemon/module/dashboard/core/domain/model/pokemon.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<Pokemon> pokemons;

  DashboardLoaded(this.pokemons);
}
