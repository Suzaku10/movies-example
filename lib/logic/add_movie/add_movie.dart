import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_example/model/movie.dart';
import 'package:movies_example/repository/movies_repository.dart';
import 'package:movies_example/route/router.gr.dart';
import 'package:movies_example/utilities/bottom_sheet/bottom_sheet.dart';
import 'package:movies_example/utilities/constant_utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:movies_example/utilities/ui_utilities.dart';

part 'add_movie.g.dart';

class AddMovie = AddMovieBase with _$AddMovie;

abstract class AddMovieBase with Store {
  @observable
  ObservableList selectedGenres = ObservableList.of([]);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController directorController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();

  String get _title => titleController.text;

  String get _director => directorController.text;

  String get _summary => summaryController.text;

  @computed
  ObservableList get selectedGenre => ObservableList.of(
      selectedGenres.where((element) => element['status'] == true).toList());

  @action
  Future<void> selectTags(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (selectedGenres.isNotEmpty) {
      var tempArray = ConstantUtilities().moviesGenre;
      List<Map<String, dynamic>> selected = List.from(selectedGenres);
      var finalArray = [];

      for (int i = 0; i < tempArray.length; i++) {
        var item = tempArray[i];
        var selectedItem =
            selected.firstWhereOrNull((element) => element['id'] == item['id']);

        if (selectedItem is Map<String, dynamic>) {
          item['status'] = selectedItem['status'];
        }

        finalArray.add(item);
      }

      ConstantUtilities.listSavedGenre = tempArray;
    }

    var result = await showModalBottomSheet(
        context: context, builder: (context) => BottomSheetUtilities());

    if (result != null) {
      selectedGenres = ObservableList.of(result);
    }
  }

  @action
  void deleteGenre(Map<String, dynamic> item) {
    List<Map<String, dynamic>> _selectedGenre = List.from(selectedGenres);

    _selectedGenre.where((element) => element == item).single['status'] = false;

    ConstantUtilities.listSavedGenre = null;

    selectedGenres = ObservableList.of(_selectedGenre);
  }

  void submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (_validation()) {
      EasyLoading.showToast("please fill all field", toastPosition: EasyLoadingToastPosition.bottom);
    } else {
      EasyLoading.show(
          dismissOnTap: false, maskType: EasyLoadingMaskType.clear);
      MovieModel item = MovieModel(
          MoviesRepository.allMovies.isEmpty
              ? 0
              : (MoviesRepository.allMovies.last.id + 1),
          title: _title,
          director: _director,
          tags: List.from(selectedGenres),
          summary: _summary);

      MoviesRepository.allMovies.add(item);
      Future.delayed(Duration(seconds: 3)).then((value) {
        if (EasyLoading.isShow) EasyLoading.dismiss();
        context.router.pushAndPopUntil(MoviesListRoute(),
            predicate: (Route<dynamic> route) => false);
      });
    }
  }

  Future<bool> onWillPop(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (_validation(isToSubmit: false)) {
      var result = await showDialog(
              context: context,
              builder: (_) => UIUtilities.dialog(context,
                  title: "Your Unsaved data will be lost")) ??
          false;
      return Future.value(result);
    } else {
      return Future.value(true);
    }
  }

  bool _validation({bool? isToSubmit = true}) {
    bool isEmpty = selectedGenres
        .where((element) => element['status'] == true)
        .toList()
        .isEmpty;
    bool? result;

    if (isToSubmit!) {
      result = _title.isEmpty || _director.isEmpty || _summary.isEmpty || isEmpty;
    } else {
      result = _title.isNotEmpty ||
          _director.isNotEmpty ||
          _summary.isNotEmpty ||
          !isEmpty;
    }

    return result;
  }
}
