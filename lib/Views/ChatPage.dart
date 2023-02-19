import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final uid;
  //uid for testing
  const ChatPage({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  TextEditingController msgCrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: instance
            .collection("personal-chat")
            .doc("chat-0001")
            .collection("messages")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.brown.shade800,
                  flexibleSpace: Container(
                    padding: EdgeInsets.only(right: 16, left: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        CircleAvatar(
                          maxRadius: 20,
                          child: Text(
                            "LC",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Common-Chat_Room",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Lets-chat",
                                style: TextStyle(
                                    color: Colors.white30, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    PopupMenuButton(
                      color: Colors.white70,
                      itemBuilder: (context) => [],
                    )
                  ],
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: false,
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          print(
                              "from data firebase${snapshot.data!.docs[index]["from"]}");
                          return Container(
                            padding: EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                              alignment: (snapshot.data!.docs[index]["from"] !=
                                      widget.uid
                                  ? Alignment.topLeft
                                  : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (snapshot.data!.docs[index]["from"] !=
                                          widget.uid
                                      ? Colors.grey.shade200
                                      : Colors.blue[200]),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  snapshot.data!.docs[index]["data"],
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                        height: 60,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextField(
                                controller: msgCrl,
                                decoration: InputDecoration(
                                    hintText: "Write message...",
                                    hintStyle: TextStyle(color: Colors.black54),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                if (msgCrl.text != "") {
                                  try {
                                    WriteBatch batch = instance.batch();
                                    batch.set(
                                        instance
                                            .collection("personal-chat")
                                            .doc("chat-0001")
                                            .collection("messages")
                                            .doc(DateTime.now()
                                                .millisecondsSinceEpoch
                                                .toString()),
                                        {
                                          "data": msgCrl.text,
                                          "from": widget.uid,
                                          "to": "Common-Chat",
                                          "type": "text",
                                          "time": "10.24 am",
                                          "id": DateTime.now()
                                              .millisecondsSinceEpoch
                                        });
                                    batch.commit();
                                    setState(() {});
                                  } catch (e) {
                                    log(e.toString());
                                  }
                                  msgCrl.clear();
                                }
                              },
                              child: Icon(
                                Icons.send,
                                color: Colors.white70,
                                size: 18,
                              ),
                              backgroundColor: Colors.brown.shade800,
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
