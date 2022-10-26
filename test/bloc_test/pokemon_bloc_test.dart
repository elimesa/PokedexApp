import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/src/bloc/pokemon_bloc.dart';
import 'package:pokedex_app/src/model/pokemon.dart';
import 'package:pokedex_app/src/repository/pokemon_repository_base.dart';


@GenerateMocks([PokemonRepositoryBase])
void main() {


  group('News Test', () {
    final pokemon = Pokemon(id: 11, name: "metapod");
    final mockRepo = MocksPokemonRepositoryBase();

    blocTest<PokemonCubit, PokemonState>(
      'News will be loaded correctly',
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

    /*blocTest<PokemonCubit, PokemonState>(
      'When the Api key is not valid exception is handled correctly',
      build: () {
        when(mockRepo.topHeadLines(any)).thenAnswer((_) async => throw ApiKeyInvalidException());
        return PokemonCubit(mockRepo);
      },
      act: (cubit) async => cubit.loadTopPokemon(),
      expect: () => [
        PokemonLoadingState(),
        PokemonErrorState('La api Key no es valida'),
      ],
    );*/
  });
}
