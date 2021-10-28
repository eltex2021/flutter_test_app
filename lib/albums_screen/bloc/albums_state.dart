part of 'albums_bloc.dart';


abstract class AlbumsState {}

//Загрузка
class InitialAlbumsState extends AlbumsState {}

//Инициализация и данные
class LoadingAlbumsState extends AlbumsState {
  final List<Album> albums;

  LoadingAlbumsState({required this.albums});
}

//Ошибка
class ErrorAlbumsState extends AlbumsState {}

