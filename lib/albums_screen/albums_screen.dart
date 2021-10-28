import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/data/network/models/album_model.dart';
import 'package:flutter_eclipse_test/data/network/models/photos_model.dart';
import 'package:flutter_eclipse_test/details_album_screen/bloc/photos_bloc.dart';
import 'package:flutter_eclipse_test/details_album_screen/details_album_screen.dart';

import 'bloc/albums_bloc.dart';

class AlbumsScreen extends StatelessWidget {
  int id;

  AlbumsScreen(this.id, {Key? key}) : super(key: key);

  final List<Album> _albums = [];
  final List<Photos> _photos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Albums"),
      ),
      body: BlocBuilder<AlbumsBloc, AlbumsState>(builder: (context, state) {
        if (state is InitialAlbumsState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is LoadingAlbumsState) {
          _albums.addAll(state.albums.where((element) => id == element.userId));

          print(_albums.length);
          return ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: _albums.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsAlbumScreen(_albums[index].id),
                          ),
                        );
                      },
                      child: BlocBuilder<PhotosBloc, PhotosState>(
                          builder: (context, state) {
                        if (state is InitialPhotosState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is LoadingPhotosState) {
                          //добавляем в list фото этого юзера
                          _photos.addAll(state.photos
                              .where((element) => element.albumId == id));

                          return SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(_photos[index].url),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          130,
                                      child: Text(_albums[index].title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                        return const Text("error");
                        ;
                      }),
                    ),
                  ),
                );

                //   Card(
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                //     child: GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => DetailsAlbumScreen(),
                //           ),
                //         );
                //       },
                //       child: SizedBox(
                //         height: 40,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(_albums[index].title,
                //                 maxLines: 1, overflow: TextOverflow.ellipsis),
                //             Text(_albums[index].userId.toString(),
                //                 maxLines: 1, overflow: TextOverflow.ellipsis),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // );
              });
        }
        ;
        return const Text("error");
      }),
    );
  }
}
