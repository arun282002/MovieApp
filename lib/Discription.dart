import 'package:flutter/material.dart';

class Discription extends StatelessWidget {

  final String name,description,bannerurl,posterurl,voting,date;
  const Discription({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.voting, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discription"),
      ),
      body:Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        child: Image.network(bannerurl,fit: BoxFit.cover,),
                      )
                  ),
                  Positioned(
                    bottom: 25,
                      left: 10,
                      child: Text("Average Rating"+voting,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(15),
              child: Text(name!=null?name:'Loading',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text("Release Date - "+date,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15,left: 10),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(left: 10,top: 20),
                    child: Text(description,style: TextStyle(fontSize: 15),),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
