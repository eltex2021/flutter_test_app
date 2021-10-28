part of 'users_bloc.dart';

// для экрана персонажа. Загрузка данных и переключение isGrid 01.06.2021


abstract class UsersState {}

//Загрузка
class InitialUsersState extends UsersState {}


//Инициализация и данные
class LoadingUsersState extends UsersState {

  final List<Users> users;

  LoadingUsersState({required this.users});
}

//Ошибка
class ErrorUsersState extends UsersState {}




























// делал для варианта с применением Equatable не завершено
// part of 'percon_screen_bloc.dart';
//
// abstract class PerconProfileState extends Equatable {
//   const PerconProfileState();
//
//   @override
//   List<Object> get props => [];
// }
//
// /// Состояние для инициализации
// class InitialPerconProfileState extends PerconProfileState {}
//
// class LoadingPerconProfileState extends PerconProfileState {}
//
// class DataPerconProfileState extends PerconProfileState {
//   final SingleCharacter ch1;
//
//   DataPerconProfileState(
//     @required this.ch1,
//   );
//
//   @override
//   List<Object> get props => [ch1];
// }
//
// class ErrorProfileState extends PerconProfileState {}
