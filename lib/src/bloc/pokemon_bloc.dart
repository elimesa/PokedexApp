import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:pokedex_app/src/model/pokemon.dart';
import 'package:pokedex_app/src/repository/pokemon_repository_base.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  /// The repository must be injected into cubit
  final PokemonRepositoryBase _repository;

  PokemonCubit(this._repository) : super(PokemonInitial());

  /// The presentation layer will be the one that will call this function
  Future<void> loadTopPokemon({int page = 0}) async {
    try {
      /// We send a new status to the presentation layer to tell it that we are loading the pokemon.
      emit(PokemonLoadInProgress());

      /// We load the news from the repository
      final response = await _repository.topHeadLines(page);

      /// We send a new status to the presentation layer to tell it that we successfully
      /// loaded and it has to show the listing
      emit(PokemonLoadSuccess(
          listPokemon: response.pokemonList,
          canLoadNextPage: response.canLoadNextPage));
    } on Exception catch (e) {
      /// In case of any exception we trap it and send a new status to the presentation layer.
      emit(PokemonLoadFailed(error: e as Error));
    }
  }
}
