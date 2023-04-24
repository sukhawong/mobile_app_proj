import 'package:auto_route/annotations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:project/config/routes.gr.dart';
import 'package:project/models/book_model.dart';
import 'package:project/providers/detail_provider.dart';
import 'package:project/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailScreen extends StatelessWidget {
  BookDetailScreen({@PathParam('bookId') this.bookId});

  final String? bookId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Book Detail"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            if (_isBookListNotEmpty(context)) {
              Navigator.pop(context);
            } else {
              context.pushRoute(HomeScreen());
            }
          },
        ),
      ),
      bottomNavigationBar: _bottomNavWidget(),
      body: Container(
        height: double.infinity,
        color: Color(0xFF10000E),
        child: FutureBuilder<BookModel?>(
          future: DetailProvider().getBookDetail(this.bookId),
          builder: (context, apiResponse) {
            final bookModel = apiResponse.data;
            DetailProvider.bookUrl = bookModel?.bookUrl;

            if (apiResponse.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (apiResponse.connectionState == ConnectionState.done &&
                bookModel == null) {
              return Center(
                child: Text(
                  "Data not found",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      decoration: TextDecoration.none),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      "${bookModel?.title}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      "${bookModel?.subtitle ?? "-"}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Image.network(bookModel?.thumbnail ?? "",
                          height: 200, width: 200)),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: HtmlWidget(bookModel?.description ?? "-",
                          textStyle: TextStyle(color: Colors.white))),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool _isBookListNotEmpty(BuildContext context) {
    return Provider.of<HomeProvider>(context, listen: false).books.isNotEmpty;
  }

  Widget _bottomNavWidget() {
    final widget = Container(
      color: Color(0xFFBA9043),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Buy Book",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
    );
    return InkWell(
      child: widget,
      onTap: () async {
        final _url = DetailProvider.bookUrl;
        if (_url != null) {
          if (!await launch(_url)) throw 'Could not launch $_url';
        }
      },
    );
  }
}
