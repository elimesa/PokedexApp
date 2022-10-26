import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:pokedex_app/src/provider/response/pokemon_info_response.dart';
import 'package:pokedex_app/src/provider/response/pokemon_response.dart';
import 'package:pokedex_app/src/provider/response/pokemon_species_info_response.dart';

class PokemonProvider {
  final baseUrl = 'pokeapi.co';

  final http.Client _httpClient;

  PokemonProvider({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<PokemonResponse> getPokemonPage(int pageIndex) async {
    final queryParam = {'limit': '151', 'offset': (pageIndex * 151).toString()};

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParam);

    final response = await _httpClient.get(uri);
    final json = jsonDecode(response.body);

    return PokemonResponse.fromJson(json);
  }

  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await _httpClient.get(uri);
      final json = jsonDecode(response.body);
      return PokemonInfoResponse.fromJson(json);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(
      int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await _httpClient.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpeciesInfoResponse.fromJson(json);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
