import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/data/album_repository.dart';
import 'package:flutter_eclipse_test/data/network/models/album_model.dart';
import 'package:flutter_eclipse_test/data/network/models/photos_model.dart';
import 'package:flutter_eclipse_test/data/photos_repository.dart';

part 'photos_event.dart';

part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosRepository repository;

  PhotosBloc({required this.repository}) : super(InitialPhotosState());

  @override
  Stream<PhotosState> mapEventToState(
    PhotosEvent event,
  ) async* {
    if (event is InitialPhotosEvent) {
      print("ждем ");
      yield InitialPhotosState();
      try {
        List<Photos> photos = await repository.getPhotos();
        print("ждем photos");

        yield LoadingPhotosState(photos: photos);
      } catch (_) {
        yield ErrorPhotosState();
        print("Ошибка AlbumState");
      }
    }
  }
}
