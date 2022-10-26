import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex_app/src/bloc/pokemon_bloc.dart';
import 'package:pokedex_app/src/navigation/routes.dart';
import 'package:pokedex_app/src/repository/pokemon_repository_base.dart';

class PokemonScreen extends StatelessWidget {
  static Widget create(BuildContext context) {
    return BlocProvider<PokemonCubit>(
      create: (_) {
        final repository = context.read<PokemonRepositoryBase>();
        return PokemonCubit(repository)..loadTopPokemon();
      },
      child: PokemonScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex App"),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonLoadFailed) {
            return Text(state.error.toString());
          }
          final pokemonList = (state as PokemonLoadSuccess).listPokemon;

          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.4),
              itemCount: pokemonList.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.pokemonDetails,
                          arguments: pokemonList[index]);
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Image.network(pokemonList[index].imageUrl,
                          fit: BoxFit.scaleDown),
                    ));
              });
        },
      ),
    );
  }
}
