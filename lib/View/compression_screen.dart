import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class CompressionScreen extends StatefulWidget {
  final File image;
  CompressionScreen({Key? key, required this.image}) : super(key: key);

  @override
  _CompressionScreenState createState() => _CompressionScreenState();
}

class _CompressionScreenState extends State<CompressionScreen> {
  String? _taskId;
  late  DownloadTaskStatus _downloadStatus = DownloadTaskStatus.undefined;

  Timer? _debounceTimer;
  late String _downloadPath;

  void _onSliderChanged(double value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(Duration(milliseconds: 500), () {
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

  void downloadImage() async {
    if (_compressedImage == null) {
      return;
    }

    final savedDir = await getExternalStorageDirectory();
    final taskId = await FlutterDownloader.enqueue(
      url: _compressedImage!.path,
      savedDir: savedDir!.path,
      fileName: 'compressed_image.jpg',
      showNotification: true,
      openFileFromNotification: true,
    );

    setState(() {
      _downloadStatus = DownloadTaskStatus.undefined;
    });

    FlutterDownloader.registerCallback((id, status, progress) {
      if (taskId == id) {
        setState(() {
          _downloadStatus = status;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initDownloadPath();
    compressImage();
    FlutterDownloader.registerCallback((id, status, progress) {
      if (_taskId == id) {
        setState(() {
          _downloadStatus = status;
        });
      }
    });
  }

  Future<void> _initDownloadPath() async {
    final directory = await getExternalStorageDirectory();
    _downloadPath = directory!.path;
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
                    onPressed: downloadImage,
                    child: Text('Download Compressed Image'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Download Status: $_downloadStatus',
                    style: TextStyle(fontSize: 18),
                  ),
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
