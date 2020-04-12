import 'package:flutter/material.dart';
import 'Model/Movie_respond.dart';
import 'Model/search_Model.dart';
import 'movie_details_screen.dart';
import 'Model/movie_details_model.dart';

class searched_result extends StatefulWidget
{
  String message;
  searched_result(this.message);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _searched_result(this.message);
  }

}
class _searched_result extends State<searched_result>
{
  String message;
  _searched_result(this.message);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initdata();
  }

  SearchedItems searchedItems = new SearchedItems();
  movie_respond mr = new movie_respond();
  void initdata() async {
    searchedItems = await mr.getsearched_result(message);
    setState(() {
      searchedItems = searchedItems;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
        elevation: 0,
      ),
      body: Container(
          color: Colors.white,
          child:Center(

            child: ListView.builder(
                itemCount: ret_len(),
                itemBuilder: (BuildContext context, int pos) {
                  return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>moviedetails(new mov_det(searchedItems.results[pos].voteCount, searchedItems.results[pos].posterPath, searchedItems.results[pos].id, searchedItems.results[pos].backdropPath, searchedItems.results[pos].genreIds, searchedItems.results[pos].title, searchedItems.results[pos].voteAverage, searchedItems.results[pos].overview, searchedItems.results[pos].releaseDate)))
                        );
                      },
                      child:Container(
                        width: 160.0,
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  searchedItems.results[pos].posterPath==null?Image.asset("assests/black.jpg",width: 90,height: 100,):Image.network("http://image.tmdb.org/t/p/w200" +
                                      searchedItems.results[pos].posterPath,width: 90,),
                                  SizedBox(
                                      width: 250,
                                      child:ListTile(
                                        title: Text(searchedItems.results[pos].title),
                                        subtitle: Text(searchedItems.results[pos].releaseDate==null?"????":searchedItems.results[pos].releaseDate),
                                      )
                                  )
                                ],
                              )

                            ],
                          ),
                        ),
                      )
                  );
                }),
          )
      ),
    ) ;
  }
  int ret_len() {
    var getUsernameLength = 0;
    if (searchedItems.results == null) {
      return getUsernameLength;
    } else {
      print(searchedItems.results.length);
      return searchedItems.results.length;
    }
  }

}


