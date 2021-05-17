import 'package:flutter/material.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _image;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    // requestPermnission();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: _image == null
              ? Text('No image selected.')
              : Image.file(
                  _image,
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: "Pick Image",
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
