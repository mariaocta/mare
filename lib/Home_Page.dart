import 'package:flutter/material.dart';
import 'books_data.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 9,
          itemBuilder: (context, index){
            final BooksData books = booksData[index];
            return Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return DetailPage (detailbuku: index);
                  }));
                },
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 1000,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(books.imageLinks),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
  }
