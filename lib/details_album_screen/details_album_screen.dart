import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eclipse_test/data/network/models/photos_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'bloc/photos_bloc.dart';

class DetailsAlbumScreen extends StatelessWidget {
  DetailsAlbumScreen(this.id, {Key? key}) : super(key: key);
  final int id;

  final List<Photos> _photos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details of Album"),
      ),
      body: BlocBuilder<PhotosBloc, PhotosState>(builder: (context, state) {
        if (state is InitialPhotosState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadingPhotosState) {
          _photos
              .addAll(state.photos.where((element) => id == element.albumId));

          return ListView(
            children: [
              SizedBox(
                  height: 400.0,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 300,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      //onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Image.network(_photos[index].url);
                    },
                    itemCount: _photos.length,
                  )),
              //const SizedBox(height: 5,),
              const Text(
                "All photos of this user",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    itemCount: _photos.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        //color: Colors.grey,
                        width: 164,
                        height: 192,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 120,
                              width: 122,
                              child: SizedBox(
                                  child: Image.network(_photos[index].url)),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [],
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                _photos[index].title,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Text(" "),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
        }
        return const Center(
          child: Text("error"),
        );
      }),
    );
  }
}
