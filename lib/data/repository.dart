import 'dart:convert';
import 'package:http/http.dart' as http;

import 'network/models/user_model.dart';

abstract class UsersRepository {
  Future<List<Users>> getUsers();
}

class UsersRepositoryImpl implements UsersRepository {
  @override
  Future<List<Users>> getUsers() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    // ignore: avoid_print
    //print("тест 1");

    if (response.statusCode == 200) {
      List<dynamic> myUsers = json.decode(response.body);
      //print(myUsers);
      List<Users> users = myUsers.map((e) => Users.fromJson(e)).toList();

      return users;
    } else {
      throw Exception('Ошибка загрузки');
    }
  }
}
