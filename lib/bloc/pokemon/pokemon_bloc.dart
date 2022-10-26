import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pokedex_app/bloc/pokemon/pokemon_event.dart';
import 'package:pokedex_app/bloc/pokemon/pokemon_state.dart';
import 'package:pokedex_app/src/provider/pokemon_provider.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonProvider = PokemonProvider();

  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if(event is PokemonPageRequest) {
      yield PokemonLoadInProgress();

      try {
        final pokemonPageResponse = await _pokemonProvider.getPokemonPage(event.page);
        yield PokemonPageLoadSuccess(
            pokemonList: pokemonPageResponse.pokemonList,
            canLoadNextPage: pokemonPageResponse.canLoadNextPage);
      }catch(e) {
        yield PokemonPageLoadFailed(error: e as Error);
      }
    }
  }
}
