import 'package:flutter/material.dart';
import 'package:flutter_eclipse_test/albums_screen/albums_screen.dart';
import 'package:flutter_eclipse_test/data/network/models/album_model.dart';
import 'package:flutter_eclipse_test/data/network/models/photos_model.dart';
import 'package:flutter_eclipse_test/data/network/models/post_model.dart';
import 'package:flutter_eclipse_test/posts_screen/posts_screen.dart';
import 'package:flutter_eclipse_test/second_screen/widgets/second_screen_albums_widget.dart';
import 'package:flutter_eclipse_test/second_screen/widgets/second_screen_posts_widget.dart';
import 'package:flutter_eclipse_test/theme/text_theme.dart';

import '../data/network/models/user_model.dart';

class SecondScreen extends StatelessWidget {
  final Users users;

  SecondScreen(this.users, {Key? key}) : super(key: key);

  final List<Post> _posts = [];
  final List<Album> _albums = [];
  final List<Photos> _photos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(users.username),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("name: " + users.name.toString()),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("email: " + users.email.toString()),
              const SizedBox(
                height: 10,
              ),
              Text("phone: " + users.phone.toString()),
              const SizedBox(
                height: 10,
              ),
              Text("website: " + users.website.toString()),
              const SizedBox(
                height: 10,
              ),
              const Text("working ["),
              const SizedBox(
                height: 10,
              ),
              Text(users.company.name),
              const SizedBox(
                height: 10,
              ),
              Text(users.company.bs),
              const SizedBox(
                height: 10,
              ),
              Text(
                "\"" + users.company.catchPhrase + "\"",
                style: AppTexsts.black14curs,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("]"),
              const SizedBox(
                height: 10,
              ),
              Text(
                "address: " +
                    users.address.street +
                    ", " +
                    users.address.suite +
                    ", " +
                    users.address.city +
                    ", " +
                    users.address.zipcode,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              buildSizedBox1(context),
              SecondScreenPostsWidget(posts: _posts, users: users),
              buildSizedBox2(context),
              SecondScreenAlbumsWidget(
                albums: _albums,
                users: users,
                photos: _photos,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox1(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.blue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Posts",
              style: AppTexsts.black14,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostsScreen(users.id),
                    ),
                  );
                },
                child: const Text(
                  "See All",
                  style: AppTexsts.black14,
                )),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox2(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.blue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Albums",
              style: AppTexsts.black14,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlbumsScreen(users.id),
                    ),
                  );
                },
                child: const Text(
                  "See All",
                  style: AppTexsts.black14,
                )),
          ],
        ),
      ),
    );
  }
}
