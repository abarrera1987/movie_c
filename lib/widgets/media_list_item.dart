import 'package:flutter/material.dart';
import 'package:movie_app/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;
  MediaListItem(this.media);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Stack(
              children: <Widget>[
                new FadeInImage.assetNetwork(
                  placeholder: "asset/placeholder.jpg",
                  image: media.getBackDropUrl(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                  fadeInDuration: new Duration(milliseconds: 40),
                ),
                new Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                    ),
                    constraints: new BoxConstraints.expand(height: 55.0),
                  ),
                ),
                new Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          media.title,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      new Container(
                        width: 250.0,
                        child: new Text(
                          media.getGenres(),
                          style: new TextStyle(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis
                        ),
                      )
                    ],
                  ),
                ),
                new Positioned(
                  right: 5.0,
                  bottom: 10.0,
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Text(media.voteAverage.toString()),
                          new Container(width: 4,),
                          new Icon(Icons.star, size: 15.0,)
                        ],
                      ),
                      new Container(width: 4.0,),
                      new Row(
                        children: <Widget>[
                          new Text(media.getReleaseYear().toString()),
                          new Icon(Icons.date_range, size: 15.0,)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
