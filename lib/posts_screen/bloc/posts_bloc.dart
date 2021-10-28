import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/data/network/models/post_model.dart';

import 'package:flutter_eclipse_test/data/post_repository.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostRepository repository;

  PostsBloc({required this.repository}) : super(InitialPostsState());

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    if (event is InitialPostsEvent) {
      //print("ждем ");
      yield InitialPostsState();
      try {
        List<Post> posts = await repository.getPost();
        //print("ждем posts");

        yield LoadingPostsState(posts: posts);
      } catch (_) {
        yield ErrorPostsState();
        //print("Ошибка postState");
      }
    }
  }
}
