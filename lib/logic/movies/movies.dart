import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:auto_route/auto_route.dart';
import 'package:movies_example/model/movie.dart';
import 'package:movies_example/repository/movies_repository.dart';
import 'package:movies_example/utilities/constant_utilities.dart';

import '../../route/router.gr.dart';

part 'movies.g.dart';

class Movies = MoviesBase with _$Movies;

abstract class MoviesBase with Store {
  @observable
  ObservableList<MovieModel> movies =
      ObservableList.of(MoviesRepository.allMovies);

  @computed
  bool get isMoviesEmpty => movies.isEmpty;

  void navigateToAddMovie(BuildContext context) {
    ConstantUtilities.listSavedGenre = null;
    context.pushRoute(AddMoviesRoute(info: "ini dari mobx"));
  }

  void navigateToEditMovie(BuildContext context, int? id) {
    context.pushRoute(EditDeleteMoviesRoute(id: id));
  }

  String? getTitleInitial(MovieModel model) {
    String result;
    var titleInitials = model.title!.trim().split(' ');
    if (titleInitials.length > 1) {
      result = '${titleInitials[0][0]}${titleInitials[1][0]}';
    } else {
      result = titleInitials[0][0];
    }

    return result.toUpperCase();
  }
}
