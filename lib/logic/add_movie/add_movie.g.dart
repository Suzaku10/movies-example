// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_movie.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddMovie on AddMovieBase, Store {
  Computed<ObservableList<dynamic>>? _$selectedGenreComputed;

  @override
  ObservableList<dynamic> get selectedGenre => (_$selectedGenreComputed ??=
          Computed<ObservableList<dynamic>>(() => super.selectedGenre,
              name: 'AddMovieBase.selectedGenre'))
      .value;

  final _$selectedGenresAtom = Atom(name: 'AddMovieBase.selectedGenres');

  @override
  ObservableList<dynamic> get selectedGenres {
    _$selectedGenresAtom.reportRead();
    return super.selectedGenres;
  }

  @override
  set selectedGenres(ObservableList<dynamic> value) {
    _$selectedGenresAtom.reportWrite(value, super.selectedGenres, () {
      super.selectedGenres = value;
    });
  }

  final _$selectTagsAsyncAction = AsyncAction('AddMovieBase.selectTags');

  @override
  Future<void> selectTags(BuildContext context) {
    return _$selectTagsAsyncAction.run(() => super.selectTags(context));
  }

  final _$AddMovieBaseActionController = ActionController(name: 'AddMovieBase');

  @override
  void deleteGenre(Map<String, dynamic> item) {
    final _$actionInfo = _$AddMovieBaseActionController.startAction(
        name: 'AddMovieBase.deleteGenre');
    try {
      return super.deleteGenre(item);
    } finally {
      _$AddMovieBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedGenres: ${selectedGenres},
selectedGenre: ${selectedGenre}
    ''';
  }
}
