import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/TopRated.dart';
import 'package:movie_api/Trending.dart';
import 'package:movie_api/tvserial.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Homepage extends StatefulWidget {


  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String APIKEY='a6dde6050f04cdab1d1b6c4e3a361c96';

  final String APITOKEN='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNmRkZTYwNTBmMDRjZGFiMWQxYjZjNGUzYTM2MWM5NiIsInN1YiI6IjY2NGQ2ZmE3NWNjOGNlMTk0ZTQzYzA2ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JkUWxvK8BB1X6_dOOKvZ75d2Th9hezNuI_yfUnca-G8';

  List trendingdmovies=[];
  List topratedmovies=[];
  List tv=[];


  @override
  initState() {
    super.initState();
    FetchAPI();
  }



  FetchAPI() async{
    TMDB tmdb=TMDB(ApiKeys(APIKEY, APITOKEN),
    logConfig: ConfigLogger(
      showErrorLogs: true,
      showLogs: true
    ));


    Map trendingresult=await tmdb.v3.trending.getTrending();
    Map topratedresult=await tmdb.v3.movies.getTopRated();
    Map tvresult=await tmdb.v3.tv.getPopular();

    setState(() {
      trendingdmovies=trendingresult['results'];
      topratedmovies=topratedresult['results'];
      tv=tvresult['results'];

      print(tv);
    });

    // print(trendingdmovies);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Movie TMDB",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Tvserial(tvserial: tv),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingdmovies),


        ],
      ),
    );
  }
}
