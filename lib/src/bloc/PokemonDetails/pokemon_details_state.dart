part of 'pokemon_details_bloc.dart';

@immutable
abstract class PokemonDetailsState {}

class PokemonDetailsInitial extends PokemonDetailsState {}

class PokemonDetailsLoadInProgress extends PokemonDetailsState {}

class PokemonDetailsLoadSuccess extends PokemonDetailsState {
  final PokemonInfoResponse pokemonDetails;

  PokemonDetailsLoadSuccess({required this.pokemonDetails});
}

class PokemonDetailsLoadFailed extends PokemonDetailsState {
  final Error error;

  PokemonDetailsLoadFailed({required this.error});
}
