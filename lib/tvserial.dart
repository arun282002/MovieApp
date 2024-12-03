import 'package:flutter/material.dart';

import 'Discription.dart';

class Tvserial extends StatelessWidget {

  final List tvserial;
  const Tvserial({super.key, required this.tvserial});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tv Serial",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvserial.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Discription(name: tvserial[index]['original_name'],bannerurl:  'https://image.tmdb.org/t/p/w500'+tvserial[index]['backdrop_path'],posterurl: 'https://image.tmdb.org/t/p/w500'+tvserial[index]['poster_path'],description: tvserial[index]['overview'],voting: tvserial[index]['vote_average'].toString(),date: tvserial[index]['first_air_date'],);
                      },));
                    },
                    child:
                    tvserial[index]['original_name']!=null? Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      child: Column(
                        children: [
                              Container(
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+tvserial[index]['backdrop_path'],
                                    ),fit: BoxFit.cover
                                  )
                                ),
                              ),
                          SizedBox(height: 10,),
                          Container(
                            child: Text(tvserial[index]['original_name']!=null?tvserial[index]['original_name']:"Loading",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          )
                        ],
                      ),
                    ):Container(),
                  );
                },
            ),
          ),
        ],
      ),
    );
  }
}
