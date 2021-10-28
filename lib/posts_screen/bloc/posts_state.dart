part of 'posts_bloc.dart';

// для экрана персонажа. Загрузка данных и переключение isGrid 01.06.2021

abstract class PostsState {}

//Загрузка
class InitialPostsState extends PostsState {}

//Инициализация и данные
class LoadingPostsState extends PostsState {
  final List<Post> posts;

  LoadingPostsState({required this.posts});
}

//Ошибка
class ErrorPostsState extends PostsState {}
