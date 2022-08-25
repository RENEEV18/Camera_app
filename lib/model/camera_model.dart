

import 'package:hive_flutter/adapters.dart';
  part 'camera_model.g.dart';

@HiveType(typeId: 1)
class CameraModel{
  
  @HiveField(0)
  final String image;

  @HiveField(1)
  int? id;

  CameraModel({ required this.image});
}

