import 'package:flutter/material.dart';
// llamamos la libreria que hace las peticiones
import 'package:movie_app/widgets/media_list.dart';
import 'package:movie_app/common/MediaProvaider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  
  final MediaProvaider movieProvaider = new MovieProvaider();
  final MediaProvaider shoeProvaider = new ShowProvaider();

  MediaType mediaType = MediaType.movie;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter movie"),
        backgroundColor: Color.fromARGB(1000, 74, 5, 99),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Material(),
            ),
            new ListTile(
              title: new Text("Peliculas"),
              selected: mediaType == MediaType.movie,
              trailing: new Icon(Icons.movie),
              onTap: (){
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              height: 5.5,
            ),
            new ListTile(
              title: new Text("Televisón"),
              selected: mediaType == MediaType.show,
              trailing: new Icon(Icons.live_tv),
              onTap: (){
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              height: 5.5,
            ),
            new ListTile(
              title: new Text("Cines"),
              trailing: new Icon(Icons.theaters),
            ),
            new Divider(
              height: 5.5,
            )
          ],
        ),
      ),
      body: new PageView(
        children: _getMediaList(),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        fixedColor: Colors.cyan,
        items: _getFottersOptions(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getFottersOptions() {
    return [
      new BottomNavigationBarItem(
          icon: new Icon(Icons.thumb_up), title: new Text('Populares')),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.movie), title: new Text('Próximamente')),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.star), title: new Text('Mejores'))
    ];
  }


  void _changeMediaType(MediaType type){

    if(mediaType != type){
      setState(() {
       mediaType = type; 
      });
    }

  }

  List<Widget> _getMediaList(){

    return (mediaType == MediaType.movie) ? <Widget>[
      new MediaList(movieProvaider)
    ]:
     <Widget>[
      new MediaList(shoeProvaider)
    ];

  }

}
