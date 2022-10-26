import 'package:pokedex_app/src/provider/pokemon_provider.dart';
import 'package:pokedex_app/src/provider/response/pokemon_info_response.dart';
import 'package:pokedex_app/src/provider/response/pokemon_response.dart';
import 'package:pokedex_app/src/provider/response/pokemon_species_info_response.dart';
import 'package:pokedex_app/src/repository/pokemon_repository_base.dart';

class PokemonRepository extends PokemonRepositoryBase {
  final PokemonProvider _provider;

  PokemonRepository(this._provider);

  @override
  Future<PokemonResponse> topHeadLines(int page) =>
      _provider.getPokemonPage(page);

  @override
  Future<PokemonInfoResponse> getPokemonInfoResponse(int id) =>
      _provider.getPokemonInfo(id);

  @override
  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfoResponse(int id) =>
      _provider.getPokemonSpeciesInfo(id);
}
