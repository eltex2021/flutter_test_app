import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/data/network/models/post_model.dart';
import 'package:flutter_eclipse_test/datails_post_screen/details_post_screen.dart';

import 'bloc/posts_bloc.dart';

class PostsScreen extends StatelessWidget {
  int id;

  PostsScreen(this.id, {Key? key}) : super(key: key);

  final List<Post> _posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is InitialPostsState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is LoadingPostsState) {
          _posts.addAll(state.posts.where((element) => id == element.userId));

          print(_posts.length);
          return ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsPostScreen(id: id, post: _posts[index]),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_posts[index].title,
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            Text(_posts[index].body,
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
        ;
        return const Text("error");
      }),
    );
  }
}
