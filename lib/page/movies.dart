import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_example/logic/movies/movies.dart';
import 'package:movies_example/model/movie.dart';

import '../route/router.gr.dart';

class MoviesListPage extends StatefulWidget {
  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  final Movies list = Movies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        actions: [
          TextButton(
            onPressed: () => list.navigateToAddMovie(context),
            child: Text(
              "New",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          if (list.isMoviesEmpty) {
            return Center(
                child: Text("Movies Empty,\nPlease add the new one",
                    textAlign: TextAlign.center));
          } else {
            return ListView.builder(
                itemCount: list.movies.length,
                itemBuilder: (context, index) =>
                    _buildMoviesItem(context, list.movies[index]));
          }
        },
      ),
    );
  }

  Widget _buildMoviesItem(BuildContext context, MovieModel model) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () => list.navigateToEditMovie(context, model.id),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                child: Text(list.getTitleInitial(model)!),
              ),
              VerticalDivider(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title!,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  Divider(height: 8.0),
                  Text(model.director!)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
