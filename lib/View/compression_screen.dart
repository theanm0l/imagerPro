import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:gallery_saver/gallery_saver.dart';



class CompressionScreen extends StatefulWidget {
  final File image;

  const CompressionScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<CompressionScreen> createState() => _CompressionScreenState();
}

class _CompressionScreenState extends State<CompressionScreen> {
  Timer? _debounceTimer;
  void _onSliderChanged(double value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(Duration(milliseconds: 1), () {
      setState(() {
        _compressionQuality = value;
      });
      compressImage();
    });
  }

  File? _compressedImage;
  double _compressionQuality = 1.0;

  Future compressImage() async {
    final filePath = widget.image.path;
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final split = filePath.substring(0, (lastIndex));
    final outPath = '${split}_compressed.jpg';

    final compressedImageBytes = await FlutterImageCompress.compressWithFile(
      filePath,
      minWidth: 2300,
      minHeight: 1500,
      quality: (_compressionQuality * 100).toInt(),
    );

    final compressedImageFile = File(outPath)
      ..writeAsBytesSync(compressedImageBytes!);

    setState(() {
      _compressedImage = compressedImageFile;
    });
  }

  void saveImage() async {
    await GallerySaver.saveImage(_compressedImage!.path, toDcim: true);
  }

  @override
  void initState() {
    super.initState();
    compressImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compression Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_compressedImage != null)
              Column(
                children: [
                  Image.file(
                    _compressedImage!,
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Compression Quality: ${(_compressionQuality * 100).toInt()}%',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text("original zize" ),
                  Slider(
                    value: _compressionQuality,
                    onChanged: _onSliderChanged,
                    min: 0.1,
                    max: 1.0,
                    divisions: 9,
                    label: _compressionQuality.toStringAsFixed(1),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: saveImage,
                    child: Text('Download Compressed Image'),
                  ),
                  SizedBox(height: 20),

                ],
              )
            else
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
