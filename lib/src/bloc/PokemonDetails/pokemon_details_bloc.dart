import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:pokedex_app/src/provider/response/pokemon_info_response.dart';
import 'package:pokedex_app/src/repository/pokemon_repository_base.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  /// The repository must be injected into cubit
  final PokemonRepositoryBase _repository;

  PokemonDetailsCubit(this._repository) : super(PokemonDetailsInitial());

  /// The presentation layer will be the one that will call this function
  Future<void> loadPokemon(int pokemonId) async {
    try {
      /// We send a new status to the presentation layer to tell it that we are loading the pokemon.
      emit(PokemonDetailsLoadInProgress());

      /// We load the news from the repository
      final response = await _repository.getPokemonInfoResponse(pokemonId);

      /// We send a new status to the presentation layer to tell it that we successfully
      /// loaded and it has to show the listing
      emit(PokemonDetailsLoadSuccess(pokemonDetails: response));
    } on Exception catch (e) {
      /// In case of any exception we trap it and send a new status to the presentation layer.
      emit(PokemonDetailsLoadFailed(error: e as Error));
    }
  }
}
