// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../page/add_movie.dart' as _i4;
import '../page/edit_delete_movie.dart' as _i5;
import '../page/movies.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MoviesListRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.MoviesListPage();
        }),
    AddMoviesRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<AddMoviesRouteArgs>(
              orElse: () =>
                  AddMoviesRouteArgs(info: pathParams.optString('info')));
          return _i4.AddMoviesPage(info: args.info);
        }),
    EditDeleteMoviesRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditDeleteMoviesRouteArgs>();
          return _i5.EditDeleteMoviesPage(id: args.id);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MoviesListRoute.name, path: '/'),
        _i1.RouteConfig(AddMoviesRoute.name, path: '/add-movies-page'),
        _i1.RouteConfig(EditDeleteMoviesRoute.name,
            path: '/edit-delete-movies-page')
      ];
}

class MoviesListRoute extends _i1.PageRouteInfo {
  const MoviesListRoute() : super(name, path: '/');

  static const String name = 'MoviesListRoute';
}

class AddMoviesRoute extends _i1.PageRouteInfo<AddMoviesRouteArgs> {
  AddMoviesRoute({String? info})
      : super(name,
            path: '/add-movies-page', args: AddMoviesRouteArgs(info: info));

  static const String name = 'AddMoviesRoute';
}

class AddMoviesRouteArgs {
  const AddMoviesRouteArgs({this.info});

  final String? info;
}

class EditDeleteMoviesRoute
    extends _i1.PageRouteInfo<EditDeleteMoviesRouteArgs> {
  EditDeleteMoviesRoute({required int? id})
      : super(name,
            path: '/edit-delete-movies-page',
            args: EditDeleteMoviesRouteArgs(id: id));

  static const String name = 'EditDeleteMoviesRoute';
}

class EditDeleteMoviesRouteArgs {
  const EditDeleteMoviesRouteArgs({required this.id});

  final int? id;
}
