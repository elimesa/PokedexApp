import 'package:pokedex_app/src/model/pokemon.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<Pokemon> pokemonList;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess(
      {required this.pokemonList, required this.canLoadNextPage});
}

class PokemonPageLoadFailed extends PokemonState {
  final Error error;

  PokemonPageLoadFailed({required this.error});
}
