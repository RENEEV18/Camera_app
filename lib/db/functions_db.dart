

import 'package:camera_gallery_project/model/camera_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<CameraModel>> cameralistNotifier = ValueNotifier([]);

Future<void>addImage (CameraModel value) async{

  final cameraDB =  await Hive.openBox<CameraModel>('camera_db');
  
  
   cameralistNotifier.value.add(value);
    cameralistNotifier.notifyListeners();
}


Future<void> getCamera() async{
  final cameraDB =  await Hive.openBox<CameraModel>('camera_db');
  cameralistNotifier.value.addAll(cameraDB.values);
  cameralistNotifier.notifyListeners();
}
