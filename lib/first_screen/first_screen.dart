import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/theme/text_theme.dart';

import '../data/network/models/user_model.dart';
import '../second_screen/second_screen.dart';
import 'bloc/users_bloc.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);
  final List<Users> _users = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        if (state is InitialUsersState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadingUsersState) {
          _users.addAll(state.users);
          //print(state.users.length);
          return Scaffold(
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("List of users", style: AppTexsts.black20,),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            physics: const ScrollPhysics(),
                            itemCount: _users.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SecondScreen(_users[index]),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              //
                                              // const SizedBox(
                                              //   width: 18,
                                              // ),
                                              Text("username: "),
                                              Text(_users[index].username)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              //
                                              // const SizedBox(
                                              //   width: 18,
                                              // ),
                                              Text("name: "),
                                              Text(_users[index].name)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: Text("error"));
      },
    );
  }
}
