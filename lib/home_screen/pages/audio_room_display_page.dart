import 'package:flutter/material.dart';
import 'package:zero_connect/home_screen/models/audio_join_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AudioRoomDisplayPage extends StatefulWidget {
  const AudioRoomDisplayPage({Key? key}) : super(key: key);

  @override
  State<AudioRoomDisplayPage> createState() => _AudioRoomDisplayPageState();
}

class _AudioRoomDisplayPageState extends State<AudioRoomDisplayPage> {
  final controllerRoomName = TextEditingController();
  final controllerDescription = TextEditingController();

  void addTransactions(String name, String description) {
    final newTrx = AudioJoinModel(
      creatorName: name,
      roomName: name,
      roomId: 1,
      Description: description,
      timeCreated: DateTime.now(),
    );
    setState(() {
      _roomModelList.insert(0, newTrx);
    });
  }

  List<AudioJoinModel> _roomModelList = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Alert(
                    context: context,
                    image: Image.asset('images/zer'),
                    title: "Create Room",
                    content: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.account_circle),
                            labelText: 'Room Name',
                          ),
                          controller: controllerRoomName,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'description',
                          ),
                          maxLines: 1,
                          maxLength: 50,
                          controller: controllerDescription,
                        ),
                      ],
                    ),
                    buttons: [
                      DialogButton(
                        onPressed: () {
                          addTransactions(controllerRoomName.text,
                              controllerDescription.text);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.black,
                      )
                    ]).show();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                    child: Text(
                  'Create Room',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                )),
              ),
            ),
          ),
          Container(
            height: (size.height - (106 + 96)),
            child: ListView.builder(
              itemCount: _roomModelList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      _roomModelList[index].roomName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
