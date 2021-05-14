import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_example/logic/update_movie/update_movie.dart';
import 'package:movies_example/utilities/ui_utilities.dart';

class EditDeleteMoviesPage extends StatefulWidget {
  final int? id;

  const EditDeleteMoviesPage({required this.id});

  @override
  _EditDeleteMoviesPageState createState() => _EditDeleteMoviesPageState();
}

class _EditDeleteMoviesPageState extends State<EditDeleteMoviesPage> {
  late UpdateMovie update;

  int? get id => widget.id;

  @override
  void initState() {
    update = UpdateMovie();
    update.setupReaction(id);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => update.onWillPop(context, id),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Update Movie"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => update.delete(context, id),
                    child: Text('Delete')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => update.update(context, id),
                    child: Text('Update')),
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
            update.titleController, 'Title', 'Enter Movie Name Here'),
        Divider(height: 8.0),
        UIUtilities.buildTextField(
            update.directorController, 'Director', 'Enter Director Name Here'),
        Divider(height: 8.0),
        _buildDropdown('Tags'),
        Divider(height: 8.0),
        UIUtilities.buildTextField(
            update.summaryController, 'Summary', 'Enter Movie Summary Here'),
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
                      transform: Matrix4.translationValues(5.0, -10.0, 0.0),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      child: Text(
                        title!,
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Observer(
                        builder: (context) => Wrap(
                            spacing: 8.0,
                            children: List.generate(
                              update.selectedGenre.length,
                              (index) => Chip(
                                  label: Text(
                                      update.selectedGenre[index]['genre']),
                                  onDeleted: () => update.deleteGenre(
                                      id, update.selectedGenre[index])),
                            )),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 8.0))
                  ],
                ),
              ),
              InkWell(
                onTap: () => update.selectTags(context),
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
