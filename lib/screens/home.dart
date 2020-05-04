import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_app/screens/image_full_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> foodList = [];
  CollectionReference reference = Firestore.instance.collection('food');
  @override
  void initState() {
    subscription = reference.snapshots().listen((snapshot) {
      setState(() {
        foodList = snapshot.documents;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: foodList.length,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              String image = foodList[index]['imageURL'];
              String title = foodList[index]['title'];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageFullScreen(
                                title: title,
                                image: image,
                              )));
                },
                child: Hero(
                    tag: image,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: AssetImage('image/placeholder.png'),
                            image: NetworkImage(image)),
                      ),
                    )),
              );
            },
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isEven ? 2 : 3)));
  }
}
