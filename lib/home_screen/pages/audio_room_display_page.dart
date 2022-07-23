import 'package:flutter/material.dart';
import 'package:zero_connect/home_screen/models/audio_join_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AudioRoomDisplayPage extends StatefulWidget {
  const AudioRoomDisplayPage({Key? key}) : super(key: key);

  @override
  State<AudioRoomDisplayPage> createState() => _AudioRoomDisplayPageState();
}

class _AudioRoomDisplayPageState extends State<AudioRoomDisplayPage> {
  List<AudioJoinModel> _roomModelList = [
    AudioJoinModel(
        creatorName: 'creatorName',
        roomName: 'Noname',
        roomId: 1,
        Description: "Description",
        timeCreated: DateTime.now()),
    AudioJoinModel(
        creatorName: 'creatorName1',
        roomName: 'Noname',
        roomId: 1,
        Description: "Description",
        timeCreated: DateTime.now()),
    AudioJoinModel(
        creatorName: 'creatorName2',
        roomName: 'Noname',
        roomId: 1,
        Description: "Description",
        timeCreated: DateTime.now()),
    AudioJoinModel(
        creatorName: 'creatorName3',
        roomName: 'Noname',
        roomId: 1,
        Description: "Description",
        timeCreated: DateTime.now()),
    AudioJoinModel(
        creatorName: 'creatorName4',
        roomName: 'Noname',
        roomId: 1,
        Description: "Description",
        timeCreated: DateTime.now()),
    AudioJoinModel(
        creatorName: 'creatorName5',
        roomName: 'Noname',
        roomId: 1,
        Description: "Description",
        timeCreated: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
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
                        ),
                        TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'description',
                          ),
                          maxLines: 1,
                          maxLength: 50,
                        ),
                      ],
                    ),
                    buttons: [
                      DialogButton(
                        onPressed: () => Navigator.pop(context),
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
            height: height / 1,
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
