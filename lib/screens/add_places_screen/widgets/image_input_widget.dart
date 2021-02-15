import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _takePicture() async {
    final fileImage = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if(fileImage == null){
      return;
    }//neu khong chup thi khong tra ve cai gi het
    setState(() {
      _storedImage = fileImage;
    });
    //luu tru anh tren o cung
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final imageName = path.basename(fileImage.path);
    final savedImage = await fileImage.copy('${appDir.path}/$imageName'); //sao chep ten Image vao duong dan path va luu giu o fileImage
    widget.onSelectImage(savedImage); //widget la thuoc tinh toan cuc cho phep truy cap vao lop tien ich o day
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
          )),
          child: _storedImage == null
              ? Text(
                  'No Image Taken !',
                  textAlign: TextAlign.center,
                )
              : Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: FlatButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            textColor: Colors.deepOrange,
            label: Text('Take Picture'),

          ),
        ),
      ],
    );
  }
}
