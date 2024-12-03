import 'package:flutter/material.dart';

import 'Discription.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Trending Movies",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Container(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Discription(name: trending[index]['title'],bannerurl:  'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],description: trending[index]['overview'],voting: trending[index]['vote_average'].toString(),date: trending[index]['release_date'],);
                        },));
                      },
                      child:
                      trending[index]['title']!=null? Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                                  )
                                )
                              ),
                      
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text(trending[index]['title']!=null?
                              trending[index]['title']:"loading",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            )
                          ],
                        ),
                      ):Container(),
                    );
                  },)
            ),
            SizedBox(height: 20,),


          ],
        ),
    );
  }

  Widget label(String txt){
    return Text(txt,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),);
}
}
