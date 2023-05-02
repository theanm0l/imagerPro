import 'dart:io';
import 'package:flutter/material.dart' ;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key, required File image});

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final picker = ImagePicker();
  final pdf = pw.Document();
  final List<File> _image = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("image to pdf"),
          actions: [
            IconButton(
                icon: const Icon(Icons.picture_as_pdf),
                onPressed: () {
                  createPDF();
                  savePDF();
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: pickImage,
          child: const Icon(Icons.add),
        ),
        body:
        ListView.builder(
          itemCount: _image.length,
          itemBuilder: (context, index) => Container(
              height: 400,
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              child: Image.file(
                _image[index],
                fit: BoxFit.cover,
              )),
        )

    );
  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image.add(File(pickedFile.path));
      } else {
        print('No image selected');
      }
    });
  }
  createPDF() async {

    for (var img in _image) {
      final image = pw.MemoryImage(img.readAsBytesSync());

      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context contex) {
            return pw.Center(child: pw.Image(image));
          }));
    }
  }

  savePDF() async {
    try {
      final dir = await getExternalStorageDirectory();
      print(dir?.path);
      final path = '/storage/emulated/0/Download'; // change the path to the directory where you want to save the file
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'file_$timestamp.pdf';
      final file = File('$path/$fileName');

      await file.writeAsBytes(await pdf.save());
      showPrintedMessage('success', 'saved to documents');
    } catch (e) {
      showPrintedMessage('error', e.toString());
    }
  }
  showPrintedMessage(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}