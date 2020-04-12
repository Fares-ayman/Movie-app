import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Discover.dart';
import 'search_Model.dart';
import 'Nowplaying_model.dart';
import 'Top_rated_model.dart';
import 'upcoming_model.dart';
import 'genres_model.dart';

class movie_respond
{
  final String _apiurl_for_discover="https://api.themoviedb.org/3/discover/movie?api_key=";
  final String _apiurl_for_search="https://api.themoviedb.org/3/search/movie?api_key=";
  final String _apiurl_for_nowplaying="https://api.themoviedb.org/3/movie/now_playing?api_key=";
  final String _apiurl_for_toprated="https://api.themoviedb.org/3/movie/top_rated?api_key=";
  final String _apiurl_for_upcoming="https://api.themoviedb.org/3/movie/upcoming?api_key=";
  final String _apiurl_for_genres="https://api.themoviedb.org/3/genre/movie/list?api_key=";
  final String _apikey="58e6d63543ebfaa34ef697be95fb7644";
  final String _query="&query=";

  Future<Items> getdiscover() async
  {
    final respond=await http.get('$_apiurl_for_discover$_apikey');
    try
        {
          return Items.fromJson(json.decode(respond.body));
        }
    catch(e)
    {
      throw Exception();
    }

  }

  Future<SearchedItems> getsearched_result(String message) async
  {
    final respond=await http.get('$_apiurl_for_search$_apikey$_query$message');
    try
    {
      return SearchedItems.fromJson(json.decode(respond.body));
    }
    catch(e)
    {
      print(message);
      print(e);
      throw Exception();
    }

  }
  Future<NowPlaying> getnowplaying() async
  {
    final respond=await http.get('$_apiurl_for_nowplaying$_apikey');
    try
    {
      return NowPlaying.fromJson(json.decode(respond.body));
    }
    catch(e)
    {
      throw Exception();
    }

  }
  Future<TopRated> gettoprated() async
  {
    final respond=await http.get('$_apiurl_for_toprated$_apikey');
    try
    {
      return TopRated.fromJson(json.decode(respond.body));
    }
    catch(e)
    {
      throw Exception();
    }

  }
  Future<Upcomping> getupcoming() async
  {
    String page="&page=";
    String num_page="2";
    final respond=await http.get('$_apiurl_for_upcoming$_apikey$page$num_page');
    try
    {
      return Upcomping.fromJson(json.decode(respond.body));
    }
    catch(e)
    {
      throw Exception();
    }

  }
  Future<Genres> getgenres() async
  {
    final respond=await http.get('$_apiurl_for_genres$_apikey');
    try
    {
      return Genres.fromJson(json.decode(respond.body));
    }
    catch(e)
    {
      throw Exception();
    }

  }
}