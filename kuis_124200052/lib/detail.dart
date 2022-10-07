import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:kuis_124200052/list.dart';


class DetailPage extends StatefulWidget{
  final CoffeeMenu menu;

  const DetailPage({Key? key, required this.menu}) : super (key:key);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: (isFavorite) ? Colors.blue : Colors.white,
        appBar: AppBar(
            title: Text('${widget.menu.name}'),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: (isFavorite)
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {
                  html.window.open(widget.menu.linkStore, '');
                },
                icon: Icon(Icons.coffee),
              )
            ]
        ),
        body: Column(
          children: [
            Container(
              height: 220.00,
              decoration: BoxDecoration(
                color: (isFavorite) ? Colors.cyanAccent : Colors.white,
              ),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.menu.imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      // color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        widget.menu.imageUrls[index],
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        // height: 210,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.menu.name,
                    style: TextStyle(
                        color: (isFavorite)
                            ? Colors.cyanAccent
                            : Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Description',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      widget.menu.description,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Price',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      widget.menu.price,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ingredients',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      "${widget.menu.ingredients}",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nutrition',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      widget.menu.nutrition,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Review Average ',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      widget.menu.reviewAverage,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Review Count ',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      widget.menu.reviewCount,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}