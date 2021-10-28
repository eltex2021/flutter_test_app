part of 'photos_bloc.dart';


abstract class PhotosState {}

//Инициализация
class InitialPhotosState extends PhotosState {}

//Загрузка и данные
class LoadingPhotosState extends PhotosState {
  final List<Photos> photos;

  LoadingPhotosState({required this.photos});
}

//Ошибка
class ErrorPhotosState extends PhotosState {}

