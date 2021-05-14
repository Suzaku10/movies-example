// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_sheet_base.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomSheetHelper on BottomSheetBase, Store {
  final _$genresAtom = Atom(name: 'BottomSheetBase.genres');

  @override
  ObservableList<Map<String, dynamic>> get genres {
    _$genresAtom.reportRead();
    return super.genres;
  }

  @override
  set genres(ObservableList<Map<String, dynamic>> value) {
    _$genresAtom.reportWrite(value, super.genres, () {
      super.genres = value;
    });
  }

  final _$BottomSheetBaseActionController =
      ActionController(name: 'BottomSheetBase');

  @override
  void setFlag(bool status, int id) {
    final _$actionInfo = _$BottomSheetBaseActionController.startAction(
        name: 'BottomSheetBase.setFlag');
    try {
      return super.setFlag(status, id);
    } finally {
      _$BottomSheetBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
genres: ${genres}
    ''';
  }
}
