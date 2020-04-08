import 'package:flutter/material.dart';
import 'package:flutternetflix/model/model_movie.dart';
import 'package:flutternetflix/screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  List<Movie> movies;
  BoxSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('지금 뜨는 콘텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImage(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImage(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for(var i = 0; i < movies.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<Null>(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  movie: movies[i],
                );
              }));
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.network(movies[i].poster),
          ),
        ),
      )
    );
  }

  return results;
}
