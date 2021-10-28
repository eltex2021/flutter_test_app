import 'dart:convert';
import 'package:flutter_eclipse_test/data/network/models/comments_model.dart';
import 'package:http/http.dart' as http;

abstract class CommentsRepository {
  Future<List<Comments>> getComments();
}

class CommentsRepositoryImpl implements CommentsRepository {
  @override
  Future<List<Comments>> getComments() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));

    if (response.statusCode == 200) {
      List<dynamic> myComments = json.decode(response.body);

      List<Comments> comments =
          myComments.map((e) => Comments.fromJson(e)).toList();

      return comments;
    } else {
      throw Exception('Ошибка загрузки');
    }
  }
}
