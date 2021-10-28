part of 'comments_bloc.dart';

abstract class CommentsEvent {}

class InitialCommentsEvent extends CommentsEvent {
  InitialCommentsEvent();
}
