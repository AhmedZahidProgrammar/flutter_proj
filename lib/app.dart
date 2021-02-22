import 'package:first_flutter_app/imageList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:first_flutter_app/ImageModel.dart';
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return MyAppState();
  }

}
class MyAppState extends State<MyApp>{
  int counter=0;
  List<ImageModel> images=[];
  fetchImage() async{
    counter+=1;
    final  response=await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final  imageModel=ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }
@override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          body:ImageList(images),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: fetchImage,
          ),
          appBar: AppBar(
              title: Text("Lets see some images!")
          ),
        )
    );
  }
}