import 'package:flutter/material.dart';
import 'Model/Movie_respond.dart';
import 'package:movie_app/Model/Discover.dart';
import 'searched_result.dart';
import 'Model/Nowplaying_model.dart';
import 'Model/Top_rated_model.dart';
import 'Model/upcoming_model.dart';
import 'movie_details_screen.dart';
import 'Model/movie_details_model.dart';


class homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homepage();
  }
}

class _homepage extends State<homepage> {
  int _current_index=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initdata();
  }

  Items items = new Items();
  NowPlaying nowPlaying=new NowPlaying();
  TopRated topRated=new TopRated();
  Upcomping upcomping=new Upcomping();
  movie_respond mr = new movie_respond();
  void initdata() async {
    items = await mr.getdiscover();
    nowPlaying=await mr.getnowplaying();
    topRated=await mr.gettoprated();
    upcomping=await mr.getupcoming();
    setState(() {
      items = items;
      nowPlaying=nowPlaying;
      topRated=topRated;
      upcomping=upcomping;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
        elevation: 0,
      ),
      body: oncall(_current_index),
      bottomNavigationBar: new BottomNavigationBar(selectedItemColor: Colors.purple[700],items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,size: 30),title: Text("Home")),
        BottomNavigationBarItem(icon: Icon(Icons.search,size: 30),title: Text("Search")),

      ],currentIndex:_current_index ,onTap: (index){setState(() {
        _current_index=index;
      });},),
    );
  }

  int ret_len() {
    var getUsernameLength = 0;
    if (items.results == null) {
      return getUsernameLength;
    } else {
      return items.results.length;
    }
  }
  int ret_len_nowplay() {
    var getUsernameLength = 0;
    if (nowPlaying.results == null) {
      return getUsernameLength;
    } else {
      return nowPlaying.results.length;
    }
  }
  int ret_len_toprated() {
    var getUsernameLength = 0;
    if (topRated.results == null) {
      return getUsernameLength;
    } else {
      return topRated.results.length;
    }
  }
  int ret_len_upcoming() {
    var getUsernameLength = 0;
    if (upcomping.results == null) {
      return getUsernameLength;
    } else {
      return upcomping.results.length;
    }
  }

  Widget oncall(int currentindex)
  {
    final TextEditingController _txt_search=new TextEditingController();
    switch(currentindex)
    {
      case 0: return SingleChildScrollView(
        child:Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          //height: 315,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 250,bottom: 13,),
                child: Text(
                  "Discover",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,),
                ),
              ),
              Container(
                height: 315,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ret_len(),
                    itemBuilder: (BuildContext context, int pos) {
                      return new GestureDetector(
                       onTap: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context)=>moviedetails(new mov_det(items.results[pos].voteCount, items.results[pos].posterPath, items.results[pos].id, items.results[pos].backdropPath, items.results[pos].genreIds, items.results[pos].title, items.results[pos].voteAverage, items.results[pos].overview, items.results[pos].releaseDate.year.toString())))
                         );
                       },
                        child: Container(
                          width: 160.0,
                          child: Card(
                            child: Wrap(
                              children: <Widget>[
                                Image.network("http://image.tmdb.org/t/p/w200" +
                                    items.results[pos].posterPath),
                                ListTile(
                                  title: Text(items.results[pos].title),
                                  subtitle: Text(items.results[pos].releaseDate.year
                                      .toString()),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(

                padding: EdgeInsets.only(right: 230,top: 20,bottom: 13),
                child: Text(
                  "Top Rated",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,),
                ),
              ),
              Container(
                height: 315,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ret_len_toprated(),
                    itemBuilder: (BuildContext context, int pos) {
                      return new GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>moviedetails(new mov_det(topRated.results[pos].voteCount, topRated.results[pos].posterPath, topRated.results[pos].id, topRated.results[pos].backdropPath, topRated.results[pos].genreIds, topRated.results[pos].title, topRated.results[pos].voteAverage, topRated.results[pos].overview, topRated.results[pos].releaseDate.year.toString())))
                          );
                        },
                        child: Container(
                          width: 160.0,
                          child: Card(
                            child: Wrap(
                              children: <Widget>[
                                Image.network("http://image.tmdb.org/t/p/w200" +
                                    topRated.results[pos].posterPath),
                                ListTile(
                                  title: Text(topRated.results[pos].title),
                                  subtitle: Text(topRated.results[pos].releaseDate.year
                                      .toString()),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(

                padding: EdgeInsets.only(right: 210,top: 20,bottom: 13),
                child: Text(
                  "Now playing",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,),
                ),
              ),
              Container(
                height: 315,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ret_len_nowplay(),
                    itemBuilder: (BuildContext context, int pos) {
                      return new GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>moviedetails(new mov_det(nowPlaying.results[pos].voteCount, nowPlaying.results[pos].posterPath, nowPlaying.results[pos].id, nowPlaying.results[pos].backdropPath, nowPlaying.results[pos].genreIds, nowPlaying.results[pos].title, nowPlaying.results[pos].voteAverage, nowPlaying.results[pos].overview, nowPlaying.results[pos].releaseDate.year.toString())))
                          );
                        },
                        child: Container(
                          width: 160.0,
                          child: Card(
                            child: Wrap(
                              children: <Widget>[
                                Image.network("http://image.tmdb.org/t/p/w200" +
                                    nowPlaying.results[pos].posterPath),
                                ListTile(
                                  title: Text(nowPlaying.results[pos].title),
                                  subtitle: Text(nowPlaying.results[pos].releaseDate.year
                                      .toString()),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(

                padding: EdgeInsets.only(right: 200,top: 20,bottom: 13),
                child: Text(
                  "Coming Soon",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,),
                ),
              ),
              Container(
                height: 315,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ret_len_upcoming(),
                    itemBuilder: (BuildContext context, int pos) {
                      return new GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>moviedetails(new mov_det(upcomping.results[pos].voteCount, upcomping.results[pos].posterPath, upcomping.results[pos].id, upcomping.results[pos].backdropPath, upcomping.results[pos].genreIds, upcomping.results[pos].title, upcomping.results[pos].voteAverage, upcomping.results[pos].overview, upcomping.results[pos].releaseDate.year.toString())))
                          );
                        },
                        child: Container(
                          width: 160.0,
                          child: Card(
                            child: Wrap(
                              children: <Widget>[
                                Image.network("http://image.tmdb.org/t/p/w200" +
                                    upcomping.results[pos].posterPath),
                                ListTile(
                                  title: Text(upcomping.results[pos].title),
                                  subtitle: Text(upcomping.results[pos].releaseDate.year
                                      .toString()),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),

            ],
          ),
        ),
      );
      break;
      case 1:return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 25)),
              SizedBox(
                width: 320,
                 child: TextField(controller: _txt_search,
                    decoration: InputDecoration(
                        hintText: "search for your movie",
                        prefixIcon: Icon(Icons.search,color: Colors.purple[700],),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.purple[700])

                      ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.purple[700])

                        ),

                    ),
                   cursorColor: Colors.purple[700],
                   style: TextStyle(color: Colors.purple[700]),
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 35)),
              RaisedButton(onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>searched_result(_txt_search.text))
                  );
              },
              color: Colors.purple[700],
                child: Text("Search",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple[700]),
                  borderRadius: BorderRadius.circular(50)
                ),
              )
            ],
          ),
        ),
      );

      break;
    }
  }
}
