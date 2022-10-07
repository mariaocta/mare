import 'package:flutter/material.dart';
import 'package:kuis_124200052/list.dart';
import 'package:kuis_124200052/detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<Home>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Coffee Menu"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index){
            final CoffeeMenu menu = coffeeList[index];


            return InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage (menu: menu,)
                      )
                  );
                },
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100,
                        // width: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            colorFilter: ColorFilter.mode(
                                Colors.green.withOpacity(0.6), BlendMode.dstOut),
                            image: NetworkImage(menu.imageUrls[1]),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              menu.name,
                              style: TextStyle(
                                // backgroundColor: Colors.deepPurpleAccent,
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                        color: Colors.white,
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Rating : ${menu.reviewAverage}',
                              style: TextStyle(shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    offset: Offset(2, 2))
                              ], fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Nutrition : ${menu.nutrition}',
                              style: TextStyle(shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    offset: Offset(2, 2))
                              ], fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              menu.price,
                              style: TextStyle(shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    offset: Offset(2, 2))
                              ], fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            );
          },

          itemCount: coffeeList.length,
        )
    );
  }
}