import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class SelectImage extends StatelessWidget {
  final Function(String?) onChange;
  SelectImage({Key? key, required this.onChange}) : super(key: key);
  // final XFile _image = XFile('');
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _showPicker(context);
      },
      child: const Text('select Image'),
    );
  }

  _imgFromCamera() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    onChange(image!.path);
    // setState(() {
    //   _image = image;
    // });
  }

  _imgFromGallery() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
 onChange(image!.path);
    // setState(() {
    //   _image = image;
    // });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
