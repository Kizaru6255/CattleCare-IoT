import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CowImagePicker extends StatefulWidget {
  @override
  _CowImagePickerState createState() => _CowImagePickerState();
}

class _CowImagePickerState extends State<CowImagePicker> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from gallery or camera
  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Take a photo'),
                  onTap: () async {
                    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
                    Navigator.pop(context, pickedFile);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Choose from gallery'),
                  onTap: () async {
                    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                    Navigator.pop(context, pickedFile);
                  },
                ),
              ],
            );
          },
        );
      },
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_image != null)
          Image.file(_image!, height: 150, width: 150, fit: BoxFit.cover),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _pickImage(context),
          child: Text('Pick Cow Image'),
        ),
      ],
    );
  }
}
