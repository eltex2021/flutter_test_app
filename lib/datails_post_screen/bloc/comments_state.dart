part of 'comments_bloc.dart';


abstract class CommentsState {}

//Инициализация
class InitialCommentsState extends CommentsState {}

//Загрузка и данные
class LoadingCommentsState extends CommentsState {
  final List<Comments> comments;

  LoadingCommentsState({required this.comments});
}

//Ошибка
class ErrorCommentsState extends CommentsState {}

