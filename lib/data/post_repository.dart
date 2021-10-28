import 'dart:convert';
import 'package:http/http.dart' as http;

import 'network/models/post_model.dart';

abstract class PostRepository {
  Future<List<Post>> getPost();
}

class PostRepositoryImpl implements PostRepository {
  @override
  Future<List<Post>> getPost() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      List<dynamic> myPosts = json.decode(response.body);
      //print(myUsers);
      List<Post> posts = myPosts.map((e) => Post.fromJson(e)).toList();

      return posts;
    } else {
      throw Exception('Ошибка загрузки');
    }
  }
}
