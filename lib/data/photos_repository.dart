import 'dart:convert';
import 'package:http/http.dart' as http;
import 'network/models/photos_model.dart';

abstract class PhotosRepository {
  Future<List<Photos>> getPhotos();
}

class PhotosRepositoryImpl implements PhotosRepository {
  @override
  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    if (response.statusCode == 200) {
      List<dynamic> myPhotos = json.decode(response.body);

      List<Photos> photos = myPhotos.map((e) => Photos.fromJson(e)).toList();

      return photos;
    } else {
      throw Exception('Ошибка загрузки');
    }
  }
}
