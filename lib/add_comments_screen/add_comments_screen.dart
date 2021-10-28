import 'package:flutter_eclipse_test/widgets/my_snack_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_eclipse_test/data/network/models/comments_model.dart';

class AddCommentsScreen extends StatelessWidget {
  AddCommentsScreen({Key? key, required this.id, required this.postId})
      : super(key: key);

  final int id;
  final int postId;

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerComment = TextEditingController();
  late Comments newComment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Comment"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text("Your name"),
            TextFormField(
              controller: _controllerName,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Your e-mail"),
            TextFormField(
              // textInputAction: ,
              controller: _controllerEmail,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Enter your comment"),
            TextFormField(
              controller: _controllerComment,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  postComments();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(MySnackBar.mySnackBar);
                },
                child: const Text("Send your comment")),
          ],
        ),
      ),
    );
  }

  postComments() async {
    newComment = Comments(
        body: _controllerComment.text,
        postId: postId,
        name: _controllerName.text,
        id: 501,
        email: _controllerEmail.text);

    final response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/comments"),
        body: {
          "postId": postId.toString(),
          //"id": id.toString(), id комментраия присваивается на сервере автоматически начиная с номера 501
          "name": newComment.name,
          "email": newComment.email,
          "body": newComment.body,
        });
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    /*
    Получаем вот такой ответ от сервера
    I/flutter (20524): Response status: 201
    I/flutter (20524): Response body: {
    I/flutter (20524):   "postId": "41",
    I/flutter (20524):   "name": "Sergey",
    I/flutter (20524):   "email": "my@mail.commm",
    I/flutter (20524):   "body": "hello eclipse studio",
    I/flutter (20524):   "id": 501
    I/flutter (20524): }
    */
  }
}
