import 'package:flutter/material.dart';
import 'package:movie_app/common/HttpHandler.dart';
import 'package:movie_app/model/Media.dart';
import 'package:movie_app/widgets/media_list_item.dart';
import 'package:movie_app/common/MediaProvaider.dart';

class MediaList extends StatefulWidget {

  final MediaProvaider provaider;

  MediaList(this.provaider);

  @override
  _MediaListState createState() => new _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = new List();
  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  void didUpdateWidget (MediaList oldWidget) {
    if(oldWidget.provaider.runtimeType != widget.provaider.runtimeType){

      _media = new List();
       loadMovies();
    }
    super.didUpdateWidget(oldWidget);
    
  }

  void loadMovies() async {
    var media = await widget.provaider.fetchMedia();
    setState(() {
      _media.addAll(media);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return new  MediaListItem(_media[index]);            
        },
      ),
    );
  }
}
