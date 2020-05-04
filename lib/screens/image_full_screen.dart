import 'package:flutter/material.dart';

class ImageFullScreen extends StatelessWidget {
  final image;
  final title;

  const ImageFullScreen({Key key, this.image, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(fontSize: 22, color: Colors.lightBlueAccent),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Hero(
              tag: image,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(image))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: Container(width: double.infinity,
              child: FlatButton(
                  shape:
                      OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
                  color: Colors.blue,
                  onPressed: () => Navigator.pop(context),
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 40,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
