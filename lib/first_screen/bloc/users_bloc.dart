import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/data/network/models/user_model.dart';
import 'package:flutter_eclipse_test/data/repository.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersRepository repository;

  UsersBloc({required this.repository}) : super(InitialUsersState());

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    if (event is InitialUsersEvent) {
      //print("ждем ");
      yield InitialUsersState();
      try {
        //UsersRepository? repository;
        List<Users> users = await repository.getUsers();
        //print("ждем users");

        yield LoadingUsersState(users: users);
      } catch (_) {
        yield ErrorUsersState();
        //print("Ошибка UserState");
      }
    }
  }
}
