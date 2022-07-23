import 'package:flutter/foundation.dart';

class AudioJoinModel {
  int roomId;
  String roomName;
  String creatorName;
  DateTime timeCreated;
  String Description;
  String? ImageUrl;
  AudioJoinModel(
      {required this.creatorName,
      required this.roomName,
      required this.roomId,
      required this.Description,
      required this.timeCreated,
      this.ImageUrl});
}
