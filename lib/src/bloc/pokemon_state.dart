part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonLoadSuccess extends PokemonState {
  final List<Pokemon> listPokemon;
  final bool canLoadNextPage;

  PokemonLoadSuccess(
      {required this.listPokemon, required this.canLoadNextPage});
}

class PokemonLoadFailed extends PokemonState {
  final Error error;

  PokemonLoadFailed({required this.error});
}
