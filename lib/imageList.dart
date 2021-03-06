import 'package:flutter/material.dart';
import 'package:first_flutter_app/ImageModel.dart';
class ImageList extends StatelessWidget{
final List<ImageModel> images;
ImageList(this.images);

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context,int index){
        return  buildImage(images[index]);
      },
    );

  }
  buildImage(ImageModel image){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(
            bottom: 20.0
          ),
          child: Image.network(image.url),),
          Text(image.title)
        ],
      ),
    );
  }
}