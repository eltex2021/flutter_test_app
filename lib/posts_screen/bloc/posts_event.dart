part of 'posts_bloc.dart';

abstract class PostsEvent {}

class InitialPostsEvent extends PostsEvent {
  InitialPostsEvent();
}
