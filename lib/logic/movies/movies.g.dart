// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Movies on MoviesBase, Store {
  Computed<bool>? _$isMoviesEmptyComputed;

  @override
  bool get isMoviesEmpty =>
      (_$isMoviesEmptyComputed ??= Computed<bool>(() => super.isMoviesEmpty,
              name: 'MoviesBase.isMoviesEmpty'))
          .value;

  final _$moviesAtom = Atom(name: 'MoviesBase.movies');

  @override
  ObservableList<MovieModel> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<MovieModel> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  @override
  String toString() {
    return '''
movies: ${movies},
isMoviesEmpty: ${isMoviesEmpty}
    ''';
  }
}
