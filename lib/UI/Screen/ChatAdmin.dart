import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:vehicle_repair_service/Widget/TranslateText.dart';

class ChatAdminScreen extends StatefulWidget {
  const ChatAdminScreen({super.key});

  @override
  State<ChatAdminScreen> createState() => _ChatAdminScreenState();
}

class _ChatAdminScreenState extends State<ChatAdminScreen> {
  late Socket _socket;
  late TextEditingController sender;
  List<String> chatHistory=[];

  Future<void> connectServer() async{
    _socket=io('${dotenv.env['BASE_URL']}',<String,dynamic>{
      'transports':["websocket"],
      'autoConnect':true
    });
    _socket.connect();
    listenServer();
  }

  Future<void> listenServer() async{
    _socket.emit('message',(data)=>{
      setState(() {
        chatHistory.add('Server :${data.toString()}');
      })
    });
  }

  Future<void> sendMsg(String value) async{
    _socket.emit(value,(data)=>{
      setState(() {
        chatHistory.add('You :${data.toString()}');
      })
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    sender=.new();
    connectServer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _socket.disconnect();
    _socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslateText("Chat With Admin"),
      ),
      body: Stack(
        children: [
          Expanded(
              child: ListView.builder(
              itemCount: chatHistory.length,
              itemBuilder: (context,index){
                final chat=chatHistory[index];
                final serverMsg=chat.startsWith('Server :');
                return Align(
                  alignment: serverMsg?Alignment.centerLeft:Alignment.centerRight,
                  child: TranslateText(chat.toString()),
                );

          })),
          Align(
            alignment: .bottomCenter,
            child: Row(
              children: [
                Expanded(child:Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(),
                  child:  TextFormField(
                    controller: sender,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: .circular(10)
                        )
                    ),
                  ),
                )),
                Flexible(child: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: IconButton(onPressed: (){
                    if(sender.text.isNotEmpty){
                      sendMsg(sender.text.toString().trim());
                      log("message=>Sender Message");
                    }
                    else{
                      SnackBar snackBar=SnackBar(content: TranslateText("Please write your message"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }, icon: Transform.rotate(angle: 45,child: Icon(Icons.send))),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
