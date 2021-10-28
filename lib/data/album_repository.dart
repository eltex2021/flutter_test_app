import 'dart:convert';
import 'package:http/http.dart' as http;

import 'network/models/album_model.dart';


abstract class AlbumRepository {
  Future<List<Album>> getAlbum();
}

class AlbumRepositoryImpl implements AlbumRepository {
  @override
  Future<List<Album>> getAlbum() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));

    if (response.statusCode == 200) {
      List<dynamic> myAlbums = json.decode(response.body);
      //print(myUsers);
      List<Album> albums = myAlbums.map((e) => Album.fromJson(e)).toList();

      return albums;
    } else {
      throw Exception('Ошибка загрузки');
    }
  }
}
