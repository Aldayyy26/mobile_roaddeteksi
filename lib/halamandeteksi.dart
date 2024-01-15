import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class halamandeteksi extends StatefulWidget {
  const halamandeteksi({Key? key}) : super(key: key);

  @override
  State<halamandeteksi> createState() => _halamandeteksi();
}

class _halamandeteksi extends State<halamandeteksi> {
  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('SIAP JALAN'),
          backgroundColor: Color.fromARGB(255, 79, 90, 99)),
      backgroundColor: Color(0xFF9B9696), // Ganti dengan warna yang diinginkan
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Positioned(
            left: -21,
            top: 181,
            child: Container(
              width: 291,
              height: 188,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          _image != null
              ? Image.file(
                  _image!,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  'https://tse4.mm.bing.net/th?id=OIP.xxM069cINYk82u_XH-_UJgHaEK&pid=Api&P=0&h=180'),
          SizedBox(
            height: 40,
          ),
          CustomButton(
            title: 'OPEN GALERY',
            icon: Icons.image_outlined,
            onClick: () => getImage(ImageSource.gallery),
          ),
          CustomButton(
            title: 'OPEN CAMERA',
            icon: Icons.camera,
            onClick: () => getImage(ImageSource.camera),
          ),
        ],
      )),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 280,
    child: ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 79, 90, 99),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(children: [
        Icon(icon),
        SizedBox(
          width: 20,
        ),
        Text(title),
      ]),
    ),
  );
}
