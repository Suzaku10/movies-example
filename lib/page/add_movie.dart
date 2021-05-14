import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_example/logic/add_movie/add_movie.dart';
import 'package:movies_example/utilities/ui_utilities.dart';

class AddMoviesPage extends StatefulWidget {
  final String? info;

  const AddMoviesPage({@PathParam('info') this.info});

  @override
  _AddMoviesPageState createState() => _AddMoviesPageState();
}

class _AddMoviesPageState extends State<AddMoviesPage> {
  final AddMovie addMovie = AddMovie();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => addMovie.onWillPop(context),
      child: Scaffold(
          appBar: AppBar(
            title: Text("New Movie"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => addMovie.submit(context),
                    child: Text('Save')),
              )
            ],
          ),
          body: _buildAddMovieForm()),
    );
  }

  Widget _buildAddMovieForm() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        UIUtilities.buildTextField(
            addMovie.titleController, 'Title', 'Enter Movie Name Here'),
        Divider(height: 8.0),
        UIUtilities.buildTextField(addMovie.directorController, 'Director',
            'Enter Director Name Here'),
        Divider(height: 8.0),
        _buildDropdown('Tags'),
        Divider(height: 8.0),
        UIUtilities.buildTextField(
            addMovie.summaryController, 'Summary', 'Enter Movie Summary Here'),
      ],
    );
  }

  Widget _buildDropdown(String? title) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: 50.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(5.0, -4.0, 0.0),
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        title!,
                        style: TextStyle(color: Colors.black54, fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Observer(
                        builder: (context) => Wrap(
                            spacing: 8.0,
                            children: List.generate(
                              addMovie.selectedGenre.length,
                              (index) => Chip(
                                  label: Text(
                                      addMovie.selectedGenre[index]['genre']),
                                  onDeleted: () => addMovie.deleteGenre(
                                      addMovie.selectedGenre[index])),
                            )),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 8.0))
                  ],
                ),
              ),
              InkWell(
                onTap: () => addMovie.selectTags(context),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.arrow_drop_down_sharp),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
