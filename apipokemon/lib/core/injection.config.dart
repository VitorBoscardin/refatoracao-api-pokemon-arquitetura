// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// ************************************************************************** 
// InjectableConfigGenerator 
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:apipokemon/module/dashboard/controller/dashboard_controller.dart'
    as _i100;
import 'package:apipokemon/module/dashboard/core/domain/contract/listar_pokemon_repository.dart'
    as _i200;
import 'package:apipokemon/module/dashboard/core/domain/usecase/listar_pokemon_usecase.dart'
    as _i300;
import 'package:apipokemon/module/dashboard/data/repository/listar_pokemon_repository.dart'
    as _i400;
import 'package:get_it/get_it.dart' as _i500;
import 'package:injectable/injectable.dart' as _i600;

extension GetItInjectableX on _i500.GetIt {
  
  _i500.GetIt init({
    String? environment,
    _i600.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i600.GetItHelper(this, environment, environmentFilter);

  
    gh.factory<_i200.ListarPokemonRepository>(
      () => _i400.ListarPokemonRepositoryImpl(),
    );

  
    gh.factory<_i300.ListarPokemonUsecase>(
      () => _i300.ListarPokemonUsecase(
        listarPokemonRepository: gh<_i200.ListarPokemonRepository>(),
      ),
    );

    gh.factory<_i100.DashboardController>(
      () => _i100.DashboardController(
        listarPokemonUsecase: gh<_i300.ListarPokemonUsecase>(),
      ),
    );

    return this;
  }
}
