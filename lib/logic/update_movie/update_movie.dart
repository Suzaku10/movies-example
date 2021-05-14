import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_example/model/movie.dart';
import 'package:movies_example/repository/movies_repository.dart';
import 'package:movies_example/route/router.gr.dart';
import 'package:movies_example/utilities/bottom_sheet/bottom_sheet.dart';
import 'package:movies_example/utilities/constant_utilities.dart';
import 'package:movies_example/utilities/ui_utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';

part 'update_movie.g.dart';

class UpdateMovie = UpdateMovieBase with _$UpdateMovie;

abstract class UpdateMovieBase with Store {
  @observable
  ObservableList selectedGenres = ObservableList.of([]);

  @computed
  ObservableList get selectedGenre => ObservableList.of(
      selectedGenres.where((element) => element['status'] == true).toList());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController directorController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();

  String get _title => titleController.text;

  String get _director => directorController.text;

  String get _summary => summaryController.text;

  List<ReactionDisposer>? _disposer = [];

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
  void deleteGenre(int? id, Map<String, dynamic> item) {
    List<Map<String, dynamic>> _selectedGenre = [...selectedGenre];

    _selectedGenre.where((element) => element == item).single['status'] = false;

    ConstantUtilities.listSavedGenre = null;

    selectedGenres = ObservableList.of(_selectedGenre);
  }

  Future<void> delete(BuildContext context, int? id) async {
    FocusScope.of(context).unfocus();
    var success = await showDialog(
            context: context, builder: (_) => UIUtilities.dialog(context)) ??
        false;
    if (success) {
      MoviesRepository.allMovies.removeWhere((element) => element.id == id);
      context.router.pushAndPopUntil(MoviesListRoute(),
          predicate: (Route<dynamic> route) => false);
    } else {
      EasyLoading.showToast("You don't want to delete it",
          toastPosition: EasyLoadingToastPosition.bottom);
    }
  }

  void update(BuildContext context, int? id) {
    FocusScope.of(context).unfocus();

    if (_validation()) {
      EasyLoading.showToast("please fill all field",
          toastPosition: EasyLoadingToastPosition.bottom);
    } else {
      EasyLoading.show();
      MovieModel model =
          MoviesRepository.allMovies.firstWhere((element) => element.id == id);

      int getMovieIndex = MoviesRepository.allMovies.indexOf(model);

      model = model.copyWith(
          title: _title,
          director: _director,
          summary: _summary,
          tags: List.from(selectedGenres));

      MoviesRepository.allMovies.removeAt(getMovieIndex);
      MoviesRepository.allMovies.insert(getMovieIndex, model);

      Future.delayed(Duration(seconds: 3)).then((value) {
        if (EasyLoading.isShow) EasyLoading.dismiss();
        context.router.pushAndPopUntil(MoviesListRoute(),
            predicate: (Route<dynamic> route) => false);
      });
    }
  }

  void setupReaction(int? id) {
    MovieModel model =
        MoviesRepository.allMovies.firstWhere((element) => element.id == id);

    var newList = [];
    model.tags!.forEach((element) {
      Map<String, dynamic>? newMap = {...element!};
      newList.add(newMap);
    });

    _disposer!.add(autorun((_) {
      titleController.text = model.title!;
      directorController.text = model.director!;
      summaryController.text = model.summary!;
      selectedGenres = ObservableList.of(newList);
    }));
  }

  void dispose() => _disposer = [];

  Future<bool> onWillPop(BuildContext context, int? id) async {
    FocusScope.of(context).unfocus();

    if (_validation(isToSubmit: false, id: id!)) {
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

  bool _validation({bool? isToSubmit = true, int? id}) {
    bool isEmpty = selectedGenres
        .where((element) => element['status'] == true)
        .toList()
        .isEmpty;
    bool? result;

    if (isToSubmit!) {
      result =
          _title.isEmpty || _director.isEmpty || _summary.isEmpty || isEmpty;
    } else {
      MovieModel model =
          MoviesRepository.allMovies.firstWhere((element) => element.id == id);

      List<Map<String, dynamic>> selected = List.from(selectedGenres);

      var res = true;

      if (!isEmpty) {
        for (int i = 0; i < model.tags!.length; i++) {
          var item = model.tags![i];
          var selectedItem = selected
              .firstWhereOrNull((element) => element['id'] == item!['id']);

          if (selectedItem != null &&
              (item!['status'] != selectedItem['status'])) {
            res = false;
            break;
          }
        }
      }

      result = model.title != _title ||
          model.director != _director ||
          model.summary != _summary ||
          (!res || isEmpty);
    }

    return result;
  }
}
