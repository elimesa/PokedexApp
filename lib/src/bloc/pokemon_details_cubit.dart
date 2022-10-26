import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex_app/src/model/pokemon_details.dart';
import 'package:pokedex_app/src/repository/pokemon_repository_base.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails?> {
  final PokemonRepositoryBase _repository;

  PokemonDetailsCubit(this._repository) : super(null);

  void getPokemonDetails(int pokemonId) async {
    final response =
        await Future.wait([_repository.getPokemonInfoResponse(pokemonId)]);
    final responseSpeciesInfo = await Future.wait(
        [_repository.getPokemonSpeciesInfoResponse(pokemonId)]);

    final pokemonInfo = response[0];
    final speciesInfo = responseSpeciesInfo[0];
  }

  void clearPokemonDetails() => emit(null);
}
