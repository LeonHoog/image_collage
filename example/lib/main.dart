import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_collage/image_collage.dart';
import 'package:like_button/like_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Collage(),
    );
  }
}

class Collage extends StatefulWidget {
  Collage({Key? key}) : super(key: key);

  @override
  _CollageState createState() => _CollageState();
}

class _CollageState extends State<Collage> {
  final List<Img> images = [
    Img(
      image: "assets/images/1.jpeg",
      source: ImageSource.assets,
    ),
    Img(
      image: "assets/images/2.jpeg",
      source: ImageSource.assets,
    ),
  ];
  final List<Img> images1 = [
    Img(
      image: "assets/images/3.jpeg",
      source: ImageSource.assets,
    ),
  ];
  final List<Img> images2 = [
    Img(
      image: "assets/images/4.jpeg",
      source: ImageSource.assets,
    ),
    Img(
      image: "assets/images/5.jpeg",
      source: ImageSource.assets,
    ),
    Img(
      image: "assets/images/6.jpeg",
      source: ImageSource.assets,
    ),
    Img(
      image: "assets/images/1.jpeg",
      source: ImageSource.assets,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.3),
        appBar: AppBar(
          title: Text("Image Collage Demo"),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Post 3"), Icon(Icons.more_vert)],
                        ),
                      ),
                      ImageCollage(
                        images: images1,
                        onClick: (clickedImage, images) {
                          inspect(clickedImage);
                          inspect(images);
                        },
                      ),
                      _InteractionBar(),
                    ],
                  )),
              Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              ),
              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Post 2"), Icon(Icons.more_vert)],
                        ),
                      ),
                      ImageCollage(
                        images: images,
                        onClick: (_,__) {},
                      ),
                      _InteractionBar(),
                    ],
                  )),
              Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              ),
              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Post 1"), Icon(Icons.more_vert)],
                        ),
                      ),
                      ImageCollage(
                        images: images2,
                        onClick: (_,__) {},
                      ),
                      _InteractionBar(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _InteractionBar extends StatelessWidget {
  const _InteractionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LikeButton(),
          Row(
            children: [
              Icon(Icons.share),
              SizedBox(width: 5),
              Icon(Icons.library_add)
            ],
          )
        ],
      ),
    );
  }
}
