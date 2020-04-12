import 'package:flutter/material.dart';
import 'Model/movie_details_model.dart';
import 'Model/Movie_respond.dart';
import 'Model/genres_model.dart';

class moviedetails extends StatefulWidget {
  mov_det result;
  moviedetails(this.result);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _moviedetails(result);
  }
}

class _moviedetails extends State<moviedetails> {
  mov_det result;
  _moviedetails(this.result);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initdata();
  }

  List<Genre> g = new List();
  Genres genre = new Genres();
  movie_respond mr = new movie_respond();
  void initdata() async {
    genre = await mr.getgenres();
    setState(() {
      genre = genre;
      get_movie_genres(result.genreIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[700],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(
                    "http://image.tmdb.org/t/p/w200" + result.backdropPath),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 220,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 40, top: 15),
                  child: SizedBox(
                      width: 300,
                      child: Text(
                        result.title,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))),
              Padding(
                  padding: EdgeInsets.only(right: 250, top: 5),
                  child: Text(
                    result.releaseDate,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  )),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Image(
                      image: NetworkImage(
                          "http://image.tmdb.org/t/p/w200" + result.posterPath),
                      height: 150,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 220,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: g.length,
                            itemBuilder: (BuildContext context, int pos) {
                              return Container(
                                width: 160.0,
                                child: Card(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(g[pos].name),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                          height: 140,
                          width: 250,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Text(result.overview,
                                      style: TextStyle(fontSize: 15))
                                ],
                              ),
                            ),
                          )
                      ),
                    ],
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 30),
                child:Icon(Icons.star,color: Colors.purple[700],size: 35,),

              ),
              Text(result.voteAverage.toString()+" /10 ",style: TextStyle(fontSize: 15),),
              Text(result.voteCount.toString(),style: TextStyle(fontSize: 15),)

            ],
          ),

        ),
      ),
    );
  }

  int ret_len_genres() {
    var getUsernameLength = 0;
    if (genre.genres == null) {
      return getUsernameLength;
    } else {
      return genre.genres.length;
    }
  }

  void get_movie_genres(List<int> ids) {
    for (int i = 0; i < ids.length; i++) {
      for (int j = 0; j < genre.genres.length; j++) {
        if (ids[i] == genre.genres[j].id) {
          g.add(genre.genres[j]);
          break;
        }
      }
    }
  }
}
