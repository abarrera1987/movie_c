import 'dart:async';
import 'package:movie_app/model/Media.dart';
import 'package:movie_app/common/HttpHandler.dart';

abstract class MediaProvaider {
  Future<List<Media>> fetchMedia();
}

class MovieProvaider extends MediaProvaider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchMovies();
  }
}

class ShowProvaider extends MediaProvaider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchShow();
  }
}

enum MediaType {

  movie, show

}