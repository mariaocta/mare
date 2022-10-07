import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'books_data.dart';

class DetailPage extends StatefulWidget {
  final int detailbuku;
  const DetailPage({Key? key, required this.detailbuku}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  bool toggle = false;

  Widget build(BuildContext context) {
    final BooksData books = booksData[widget.detailbuku];
    return Scaffold(
        appBar: AppBar(
          title: Text(books.title),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                icon:
                toggle ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () async {
                    if (!await launch(books.previewLink)) throw 'Could not launch ${books.previewLink}';
                  }
              ),
            )
          ],
        ),
        body: ListView(children: [
          Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.network(books.imageLinks),
                    ),
                    Text(
                      (books.title),
                      style:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text((books.description),
                      style:
                      TextStyle(fontSize: 16)
                    ),
                    Text((books.authors[0]),
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("${books.publisher} | ${books.publishedDate}"),
                    Text(books.categories[0]),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(
                          "# |",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ]));
  }
  Widget _() {
    BooksData books = booksData[widget.detailbuku];
    return ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text("${index + 1} | "),
                        title: Text(books.previewLink[index]),
                      ),
                      Image.network(books.imageLinks[index]),
                    ],
                  ),
                )
            ),
          );
        }, itemCount: books.previewLink.length);
  }
}
