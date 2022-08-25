import 'package:camera/camera.dart';
import 'package:camera_gallery_project/camera_app/camera.dart';
import 'package:camera_gallery_project/model/camera_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Hive.initFlutter();

  if(!Hive.isAdapterRegistered(CameraModelAdapter().typeId))
  {
    Hive.registerAdapter(CameraModelAdapter());
  }
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: true,
    ),
    home: CameraScreen(camera: firstCamera),
  ));
}
