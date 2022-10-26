import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/src/bloc/pokemon_bloc.dart';
import 'package:pokedex_app/src/model/pokemon.dart';
import 'package:pokedex_app/src/repository/pokemon_repository_base.dart';


@GenerateMocks([PokemonRepositoryBase])
void main() {


  group('pokemon Test', () {
    final pokemon = Pokemon(id: 11, name: "metapod");
    final mockRepo = MocksPokemonRepositoryBase();

    blocTest<PokemonCubit, PokemonState>(
      'pokemon will be loaded correctly',
      build: () {
        when(mockRepo.topHeadLines(any)).thenAnswer((_) async => [pokemon]);
        return PokemonCubit(mockRepo);
      },
      act: (cubit) async => cubit.loadTopPokemon(),
      expect: () => [
        PokemonLoadInProgress(),
        PokemonLoadSuccess(listPokemon: [pokemon], canLoadNextPage: false)
      ],
    );
  });
}
