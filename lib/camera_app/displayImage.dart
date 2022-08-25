import 'dart:io';

import 'package:camera_gallery_project/db/functions_db.dart';
import 'package:camera_gallery_project/model/camera_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayScreen extends StatelessWidget {
  final String imagepath;
  const DisplayScreen({Key? key, required this.imagepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        
         getCamera();
    return  Scaffold(
     
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 15, 29, 192),
           title: Text('Display Cliks',
           style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            
           ),),
           leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
           }, icon: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,))
      ),
      body:
      ValueListenableBuilder(  valueListenable: cameralistNotifier,
        builder:
            (BuildContext context, List<CameraModel> imageList, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: imageList.length,
                itemBuilder: (BuildContext ctx, index) {
                  final data = imageList[index];
                      return Card(
                   color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        File(data.image),
                       

                      ),
                    ),
                  );
            
            }));
      
  },
   
  ));

   
}


}