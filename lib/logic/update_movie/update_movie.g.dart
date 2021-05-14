// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_movie.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateMovie on UpdateMovieBase, Store {
  Computed<ObservableList<dynamic>>? _$selectedGenreComputed;

  @override
  ObservableList<dynamic> get selectedGenre => (_$selectedGenreComputed ??=
          Computed<ObservableList<dynamic>>(() => super.selectedGenre,
              name: 'UpdateMovieBase.selectedGenre'))
      .value;

  final _$selectedGenresAtom = Atom(name: 'UpdateMovieBase.selectedGenres');

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

  final _$selectTagsAsyncAction = AsyncAction('UpdateMovieBase.selectTags');

  @override
  Future<void> selectTags(BuildContext context) {
    return _$selectTagsAsyncAction.run(() => super.selectTags(context));
  }

  final _$UpdateMovieBaseActionController =
      ActionController(name: 'UpdateMovieBase');

  @override
  void deleteGenre(int? id, Map<String, dynamic> item) {
    final _$actionInfo = _$UpdateMovieBaseActionController.startAction(
        name: 'UpdateMovieBase.deleteGenre');
    try {
      return super.deleteGenre(id, item);
    } finally {
      _$UpdateMovieBaseActionController.endAction(_$actionInfo);
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
