import 'package:flutter/material.dart';

import 'Discription.dart';

class TopRated extends StatelessWidget {

  final List toprated;
  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top Trending Movie",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Discription(name: toprated[index]['title'],bannerurl:  'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],description: toprated[index]['overview'],voting: toprated[index]['vote_average'].toString(),date: toprated[index]['release_date'],);
                    },));
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                              )
                            )
                          ),
                        ),
                        Container(
                          child: Text(toprated[index]['title']!=null?toprated[index]['title']:"loading",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        )
                      ],
                    ),
                  ),
                );
                },),
          )
        ],
      ),
    );
  }
}
