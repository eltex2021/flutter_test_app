import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/data/album_repository.dart';
import 'package:flutter_eclipse_test/data/network/models/album_model.dart';
import 'package:flutter_eclipse_test/data/network/models/post_model.dart';




part 'albums_event.dart';

part 'albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumRepository repository;

  AlbumsBloc({required this.repository}) : super(InitialAlbumsState());

  @override
  Stream<AlbumsState> mapEventToState(
    AlbumsEvent event,
  ) async* {
    if (event is InitialAlbumsEvent) {
      print("ждем ");
      yield InitialAlbumsState();
      try {
        List<Album> albums = await repository.getAlbum();
        print("ждем posts");

        yield LoadingAlbumsState(albums: albums);
      } catch (_) {
        yield ErrorAlbumsState();
        print("Ошибка AlbumState");
      }
    }
  }
}
