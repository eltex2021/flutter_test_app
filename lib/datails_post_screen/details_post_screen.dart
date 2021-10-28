import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/add_comments_screen/add_comments_screen.dart';
import 'package:flutter_eclipse_test/data/network/models/comments_model.dart';
import 'package:flutter_eclipse_test/data/network/models/post_model.dart';
import 'package:flutter_eclipse_test/theme/text_theme.dart';

import 'bloc/comments_bloc.dart';

class DetailsPostScreen extends StatelessWidget {
  DetailsPostScreen({Key? key, required this.id, required this.post})
      : super(key: key);
  final int id;
  final Post post;

  final List<Comments> _comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details of Post"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  post.title,
                  style: AppTexsts.black20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(post.body),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const Text(
                  "Comments",
                  style: AppTexsts.black20,
                ),
                const Divider(),
                CommentsWidget(comments: _comments, id: id), //комментарии
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCommentsScreen(
                              id: id,
                              postId: post.id,
                            ),
                          ));
                    },
                    child: const Text("Add comments")),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({
    Key? key,
    required List<Comments> comments,
    required this.id,
  })  : _comments = comments,
        super(key: key);

  final List<Comments> _comments;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child:
          BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
        if (state is InitialCommentsState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadingCommentsState) {
          _comments
              .addAll(state.comments.where((element) => id == element.postId));

          print(_comments.length);
          return ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: SizedBox(
                      height: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "From: " +
                                _comments[index].name +
                                ", " +
                                _comments[index].email,
                          ),
                          const Divider(),
                          Text(
                            _comments[index].body,
                          ),
                        ],
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
