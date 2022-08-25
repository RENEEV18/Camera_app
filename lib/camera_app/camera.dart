import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_gallery_project/camera_app/displayImage.dart';
import 'package:camera_gallery_project/db/functions_db.dart';
import 'package:camera_gallery_project/model/camera_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  late Future<void> initializeControllerFuture;
  File? image;

  late String imageDisplay;

  @override
  void initState() {
    super.initState();

    controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    initializeControllerFuture = controller.initialize();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Camera Cliks',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
       
      ),
      body: SafeArea(
        child: FutureBuilder<void>(
          future: initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(controller);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: ()  {
          cameraButtonCLicked();
        },
        child: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> cameraButtonCLicked() async {
    try {
            await initializeControllerFuture;
           final image = await controller.takePicture();
            imageDisplay = image.path;
            // final imagePath = File(image.path);
            // setState(() {
            //   image = imagePath as XFile;
            // });

              
            if (!mounted) {
              return;
            }
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return DisplayScreen(imagepath: image.path);
            }));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Camera Access Denied'),
              ),
            );
          }
    

  final camera = CameraModel(image: imageDisplay);

    addImage(camera);
    getCamera();
  }
}
