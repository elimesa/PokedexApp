import 'package:flutter/material.dart';

import 'package:pokedex_app/src/model/pokemon.dart';
import 'package:pokedex_app/src/ui/pokemon_details_screen.dart';
import 'package:pokedex_app/src/ui/pokemon_screen.dart';

class Routes {
  static const topPokemon = '/';
  static const pokemonDetails = '/details';

  static Route routes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case topPokemon:
        return MaterialPageRoute(
            builder: (context) => PokemonScreen.create(context));
      case pokemonDetails:
        return MaterialPageRoute(
            builder: (context) =>
                PokemonDetailsScreen.create(context, args as Pokemon));
    }
    throw Exception('This route does not exist');
  }
}
