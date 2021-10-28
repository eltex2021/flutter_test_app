import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/data/repository.dart';
import 'package:flutter_eclipse_test/first_screen/first_screen.dart';
import 'package:flutter_eclipse_test/posts_screen/bloc/posts_bloc.dart';
import 'package:flutter_eclipse_test/posts_screen/bloc/posts_bloc.dart';
import 'package:flutter_eclipse_test/posts_screen/bloc/posts_bloc.dart';
import 'package:flutter_eclipse_test/posts_screen/bloc/posts_bloc.dart';

import 'albums_screen/bloc/albums_bloc.dart';
import 'data/album_repository.dart';
import 'data/comments_repository.dart';
import 'data/photos_repository.dart';
import 'data/post_repository.dart';
import 'datails_post_screen/bloc/comments_bloc.dart';
import 'details_album_screen/bloc/photos_bloc.dart';
import 'first_screen/bloc/users_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  print("старт");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(
          create: (context) => UsersBloc(repository: UsersRepositoryImpl())
            ..add(InitialUsersEvent()),
        ),
        BlocProvider(
          create: (context) => PostsBloc(repository: PostRepositoryImpl())
            ..add(InitialPostsEvent()),
        ),
        BlocProvider(
          create: (context) => AlbumsBloc(repository: AlbumRepositoryImpl())
            ..add(InitialAlbumsEvent()),
        ),
        BlocProvider(
          create: (context) => PhotosBloc(repository: PhotosRepositoryImpl())
            ..add(InitialPhotosEvent()),
        ),
        BlocProvider(
          create: (context) =>
              CommentsBloc(repository: CommentsRepositoryImpl())
                ..add(InitialCommentsEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstScreen(),
      ),
    );
  }
}
