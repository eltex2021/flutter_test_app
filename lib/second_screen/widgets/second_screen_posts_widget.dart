import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/data/network/models/post_model.dart';
import 'package:flutter_eclipse_test/datails_post_screen/details_post_screen.dart';
import 'package:flutter_eclipse_test/posts_screen/bloc/posts_bloc.dart';
import 'package:flutter_eclipse_test/posts_screen/posts_screen.dart';

import '../../data/network/models/user_model.dart';

class SecondScreenPostsWidget extends StatelessWidget {
  const SecondScreenPostsWidget({
    Key? key,
    required List<Post> posts,
    required this.users,
  })  : _posts = posts,
        super(key: key);

  final List<Post> _posts;
  final Users users;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is InitialPostsState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadingPostsState) {
          _posts.addAll(
              state.posts.where((element) => users.id == element.userId));

          print(_posts.length);
          return ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: 3,
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
                            builder: (context) => DetailsPostScreen(
                              id: users.id,
                              post: _posts[index],
                            ),
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
