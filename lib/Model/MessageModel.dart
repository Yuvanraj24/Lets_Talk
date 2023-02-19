import 'package:flutter/material.dart';

class MessageModel{
  String from;
  String to;
  String msgContent;
  String msgType;
  String msgTime;
  int msgId;
  MessageModel({
    required this.from,
    required this.to,
    required this.msgContent,
    required this.msgId,
    required this.msgType,
    required this.msgTime
});
}