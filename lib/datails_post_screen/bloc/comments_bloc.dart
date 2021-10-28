import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/data/comments_repository.dart';

import 'package:flutter_eclipse_test/data/network/models/comments_model.dart';
import 'package:flutter_eclipse_test/data/network/models/photos_model.dart';
import 'package:flutter_eclipse_test/data/photos_repository.dart';

part 'comments_event.dart';

part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsRepository repository;

  CommentsBloc({required this.repository}) : super(InitialCommentsState());

  @override
  Stream<CommentsState> mapEventToState(
    CommentsEvent event,
  ) async* {
    if (event is InitialCommentsEvent) {
      //print("ждем ");
      yield InitialCommentsState();
      try {
        List<Comments> comments = await repository.getComments();
        //print("ждем Comments");

        yield LoadingCommentsState(comments: comments);
      } catch (_) {
        yield ErrorCommentsState();
        print("Ошибка CommentsState");
      }
    }
  }
}
