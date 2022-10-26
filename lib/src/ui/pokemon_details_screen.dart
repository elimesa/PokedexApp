import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex_app/src/bloc/PokemonDetails/pokemon_details_bloc.dart';
import 'package:pokedex_app/src/model/pokemon.dart';
import 'package:pokedex_app/src/provider/response/pokemon_info_response.dart';
import 'package:pokedex_app/src/repository/pokemon_repository_base.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetailsScreen({Key? key, required this.pokemon})
      : super(key: key);

  static Widget create(BuildContext context, Pokemon _pokemon) {
    return BlocProvider<PokemonDetailsCubit>(
      create: (_) {
        final repository = context.read<PokemonRepositoryBase>();
        return PokemonDetailsCubit(repository)..loadPokemon(_pokemon.id);
      },
      child: PokemonDetailsScreen(
        pokemon: _pokemon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon ${pokemon.name}'),
        ),
        body: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
            builder: (context, state) {
          if (state is PokemonDetailsLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokemonDetailsLoadFailed) {
            return const Text('state.error.toString()');
          }
          final pokemonDetails =
              (state as PokemonDetailsLoadSuccess).pokemonDetails;
          return _buildCardPokemonDetail(pokemonDetails);
        }));
  }

  Widget _buildCardPokemonDetail(PokemonInfoResponse pokemonDetails) {
    return Center(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      pokemonDetails.imageUrl,
                      scale: 0.5,
                      fit: BoxFit.scaleDown,
                    ),
                    Text(
                      pokemonDetails.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'ID: ${pokemonDetails.id}  -  Weight: ${pokemonDetails.weight}  -  Height: ${pokemonDetails.height}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pokemonDetails.types
                            .map((e) => _getTypeView(e))
                            .toList()),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _getTypeView(String type) {
    Color color;
    switch (type) {
      case 'normal':
        color = Color(0xFFbdbeb0);
        break;
      case 'poison':
        color = Color(0xFF995E98);
        break;
      case 'psychic':
        color = Color(0xFFE96EB0);
        break;
      case 'grass':
        color = Color(0xFF9CD363);
        break;
      case 'ground':
        color = Color(0xFFE3C969);
        break;
      case 'ice':
        color = Color(0xFFAFF4FD);
        break;
      case 'fire':
        color = Color(0xFFE7614D);
        break;
      case 'rock':
        color = Color(0xFFCBBD7C);
        break;
      case 'dragon':
        color = Color(0xFF8475F7);
        break;
      case 'water':
        color = Color(0xFF6DACF8);
        break;
      case 'bug':
        color = Color(0xFFC5D24A);
        break;
      case 'dark':
        color = Color(0xFF886958);
        break;
      case 'fighting':
        color = Color(0xFF9E5A4A);
        break;
      case 'ghost':
        color = Color(0xFF7774CF);
        break;
      case 'steel':
        color = Color(0xFFC3C3D9);
        break;
      case 'flying':
        color = Color(0xFF81A2F8);
        break;
      case 'normal':
        color = Color(0xFFF9E65E);
        break;
      case 'fairy':
        color = Color(0xFFEEB0FA);
        break;
      default:
        color = Colors.black;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Text(
          type.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
