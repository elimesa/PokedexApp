import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:pokedex_app/src/provider/pokemon_provider.dart';

void main() {
  test('Validate response is correct', () async {
    final provider =
        _getProvider('test/provider_test/top_headlines.json');
    final listPokemon = await provider.getPokemonPage(0);

    expect(listPokemon.pokemonList.length, 5);
    expect(listPokemon.pokemonList[0].name, 'metapod');
    expect(listPokemon.pokemonList[1].name, 'butterfree');
  });
}

PokemonProvider _getProvider(String filePath) =>
    PokemonProvider(httpClient: _getMockProvider(filePath));

MockClient _getMockProvider(String filePath) => MockClient((_) async =>
    Response(await File(filePath).readAsString(), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf8'
    }));
