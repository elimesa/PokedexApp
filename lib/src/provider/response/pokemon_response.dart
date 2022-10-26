import 'package:pokedex_app/src/model/pokemon.dart';

class PokemonResponse {
  final List<Pokemon> pokemonList;
  final bool canLoadNextPage;

  PokemonResponse({required this.pokemonList, required this.canLoadNextPage});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonList = (json['results'] as List)
        .map((data) => Pokemon.fromJson(data))
        .toList();

    return PokemonResponse(
        pokemonList: pokemonList, canLoadNextPage: canLoadNextPage);
  }
}
