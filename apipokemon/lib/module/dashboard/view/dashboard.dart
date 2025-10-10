import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apipokemon/core/injection.dart';
import 'package:apipokemon/module/dashboard/controller/dashboard_controller.dart';
import 'package:apipokemon/module/dashboard/state/dashboard_state.dart';
import 'package:apipokemon/module/dashboard/core/domain/model/pokemon.dart';

class DashboardView extends StatelessWidget {
  final controller = getIt<DashboardController>();

  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => controller,
      child: BlocBuilder<DashboardController, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Pokédex'),
              centerTitle: true,
            ),
            body: Builder(
              builder: (context) {
                if (state is DashboardLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DashboardLoaded) {
                  final pokemons = state.pokemons;

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Pesquisar Pokémon",
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onChanged: (query) {
                            final filtered = pokemons
                                .where((pokemon) =>
                                    pokemon.name
                                        .toLowerCase()
                                        .contains(query.toLowerCase()))
                                .toList();
                            context.read<DashboardController>().emit(
                                  DashboardLoaded(filtered),
                                );
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: pokemons.length,
                          itemBuilder: (context, index) {
                            final pokemon = pokemons[index];
                            return ListTile(
                              title: Text(pokemon.name),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is DashboardInitial) {
                  return const Center(
                    child: Text('Carregando Pokémons...'),
                  );
                }
                return const Center(child: Text('Erro ao carregar Pokémons'));
              },
            ),
          );
        },
      ),
    );
  }
}
