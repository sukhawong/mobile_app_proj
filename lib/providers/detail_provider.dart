import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/models/book_model.dart';

class DetailProvider {
  static String? bookUrl;

  Future<BookModel?> getBookDetail(String? id) async {
    try {
      final response = await http
          .get(Uri.parse("https://www.googleapis.com/books/v1/volumes/$id"));

      //print("url ${response.request?.url}");
      //print("response.body ${jsonDecode(response.body)}");
      return BookModel.fromApi(jsonDecode(response.body));
    } catch (e) {
      print("error get book detail $e");
      return null;
    }
  }
}
