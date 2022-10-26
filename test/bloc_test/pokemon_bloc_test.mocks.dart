// Mocks generated by Mockito 5.3.2 from annotations
// in pokedex_app/test/bloc_test/pokemon_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex_app/src/provider/response/pokemon_info_response.dart'
    as _i3;
import 'package:pokedex_app/src/provider/response/pokemon_response.dart' as _i2;
import 'package:pokedex_app/src/provider/response/pokemon_species_info_response.dart'
    as _i4;
import 'package:pokedex_app/src/repository/pokemon_repository_base.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePokemonResponse_0 extends _i1.SmartFake
    implements _i2.PokemonResponse {
  _FakePokemonResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokemonInfoResponse_1 extends _i1.SmartFake
    implements _i3.PokemonInfoResponse {
  _FakePokemonInfoResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokemonSpeciesInfoResponse_2 extends _i1.SmartFake
    implements _i4.PokemonSpeciesInfoResponse {
  _FakePokemonSpeciesInfoResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PokemonRepositoryBase].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonRepositoryBase extends _i1.Mock
    implements _i5.PokemonRepositoryBase {
  MockPokemonRepositoryBase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.PokemonResponse> topHeadLines(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #topHeadLines,
          [page],
        ),
        returnValue:
            _i6.Future<_i2.PokemonResponse>.value(_FakePokemonResponse_0(
          this,
          Invocation.method(
            #topHeadLines,
            [page],
          ),
        )),
      ) as _i6.Future<_i2.PokemonResponse>);
  @override
  _i6.Future<_i3.PokemonInfoResponse> getPokemonInfoResponse(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonInfoResponse,
          [id],
        ),
        returnValue: _i6.Future<_i3.PokemonInfoResponse>.value(
            _FakePokemonInfoResponse_1(
          this,
          Invocation.method(
            #getPokemonInfoResponse,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.PokemonInfoResponse>);
  @override
  _i6.Future<_i4.PokemonSpeciesInfoResponse> getPokemonSpeciesInfoResponse(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonSpeciesInfoResponse,
          [id],
        ),
        returnValue: _i6.Future<_i4.PokemonSpeciesInfoResponse>.value(
            _FakePokemonSpeciesInfoResponse_2(
          this,
          Invocation.method(
            #getPokemonSpeciesInfoResponse,
            [id],
          ),
        )),
      ) as _i6.Future<_i4.PokemonSpeciesInfoResponse>);
}