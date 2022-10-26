import 'package:pokedex_app/src/provider/response/pokemon_info_response.dart';
import 'package:pokedex_app/src/provider/response/pokemon_response.dart';
import 'package:pokedex_app/src/provider/response/pokemon_species_info_response.dart';

abstract class PokemonRepositoryBase {
  Future<PokemonResponse> topHeadLines(int page);
  Future<PokemonInfoResponse> getPokemonInfoResponse(int id);
  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfoResponse(int id);
}
