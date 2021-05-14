import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String? title;
  final String? director;
  final String? summary;
  final List<Map<String, dynamic>?>? tags;

  MovieModel(this.id, {this.title, this.director, this.summary, this.tags});

  @override
  List<Object?> get props => [id, title, director, summary, tags];

  MovieModel copyWith(
      {String? title,
      String? director,
      String? summary,
      List<Map<String, dynamic>>? tags}) {
    return MovieModel(this.id,
        title: title ?? this.title,
        director: director ?? this.director,
        summary: summary ?? this.summary,
        tags: tags ?? this.tags);
  }
}
