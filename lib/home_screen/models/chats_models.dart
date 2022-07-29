import 'package:flutter/foundation.dart';

class ChatsModel {
  final String userName;
  final String imageUrl;
  final int noOfNewMsgs;
  final DateTime timeStamp;
  final String id;
  bool active = false;
  final String activehistory;


  ChatsModel({required this.userName, required this.imageUrl, required this.active, required this.activehistory, required this.id, required this.timeStamp, required this.noOfNewMsgs});
}
