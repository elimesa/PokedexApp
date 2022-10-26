import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex_app/src/navigation/routes.dart';
import 'package:pokedex_app/src/provider/pokemon_provider.dart';
import 'package:pokedex_app/src/repository/implementation/pokemon_repository.dart';
import 'package:pokedex_app/src/repository/pokemon_repository_base.dart';
import 'package:pokedex_app/src/ui/pokemon_screen.dart';

void main() {
  final pokemonProvider = PokemonProvider();
  final pokemonRepository = PokemonRepository(pokemonProvider);

  runApp(RepositoryProvider<PokemonRepositoryBase>(
    create: (_) => pokemonRepository,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.red, accentColor: Colors.redAccent),
      onGenerateRoute: (settings) => Routes.routes(settings),
      home: PokemonScreen.create(context),
    );
  }
}
