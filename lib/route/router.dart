import 'package:auto_route/auto_route.dart';
import 'package:movies_example/page/add_movie.dart';
import 'package:movies_example/page/edit_delete_movie.dart';
import 'package:movies_example/page/movies.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MoviesListPage, initial: true),
    AutoRoute(page: AddMoviesPage),
    AutoRoute(page: EditDeleteMoviesPage),
  ],
)
class $AppRouter{}