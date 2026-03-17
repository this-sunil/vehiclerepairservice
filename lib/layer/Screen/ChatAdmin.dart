import 'dart:developer';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../core/Routes/route.dart';
import '../../layer/Widget/TranslateText.dart';

class ChatAdminScreen extends StatefulWidget {
  const ChatAdminScreen({super.key});

  @override
  State<ChatAdminScreen> createState() => _ChatAdminScreenState();
}

class _ChatAdminScreenState extends State<ChatAdminScreen> {
  late Socket _socket;
  late TextEditingController sender;
  List<String> chatHistory = [];

  Future<void> connectServer() async {
    _socket = io(
      '${dotenv.env['BASE_URL']}/',
      OptionBuilder().setTransports(['websocket']).enableAutoConnect().build(),
    );

    _socket.onConnect((_) {
      log('System: Connected to server');
      setState(() {});
    });

    _socket.on('message', (data) {
      setState(() {
        chatHistory.add('Server: ${data.toString()}');
      });
    });

    _socket.connect();
  }

  void sendMsg(String value) {
    if (value.trim().isEmpty) return;
    _socket.emit('message', value);
    setState(() {
      chatHistory.add('You: $value');
    });
    sender.clear();
  }

  @override
  void initState() {
    super.initState();
    sender = TextEditingController();
    connectServer();
  }

  @override
  void dispose() {
    _socket.disconnect();
    _socket.dispose();
    sender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslateText(
          "Chat With Admin",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                final chat = chatHistory[index];
                final serverMsg = chat.startsWith('Server:');

                return Align(
                  alignment: serverMsg
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (serverMsg)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.grey.shade500,
                              child: Icon(
                                Icons.smart_toy,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),

                        Flexible(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 18,
                            ),
                            decoration: BoxDecoration(
                              gradient: serverMsg
                                  ? LinearGradient(
                                      colors: [
                                        Colors.grey.shade200,
                                        Colors.grey.shade300,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )
                                  : LinearGradient(
                                      colors: [
                                        Colors.orange.shade400,
                                        Colors.deepOrange.shade400,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: serverMsg
                                    ? Radius.circular(4)
                                    : Radius.circular(20),
                                bottomRight: serverMsg
                                    ? Radius.circular(20)
                                    : Radius.circular(4),
                              ),
                            ),
                            child: TranslateText(
                              chat
                                  .replaceFirst('Server:', '')
                                  .replaceFirst('You:', '')
                                  .trim(),
                              style: TextStyle(
                                color: serverMsg
                                    ? Colors.black87
                                    : Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        if (!serverMsg)
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.orange.shade400,
                              child: Icon(
                                Icons.person_outline,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: sender,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () async {
                        return showModalBottomSheet(
                          context: context,
                          builder: (BuildContext subcontext) {
                            return EmojiPicker(
                              onEmojiSelected: (category, Emoji emoji) {
                                context.pop();
                              },
                              onBackspacePressed: () {
                                context.pop();
                                // Do something when the user taps the backspace button (optional)
                                // Set it to null to hide the Backspace-Button
                              },
                              textEditingController: sender, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
                              config: Config(
                                height: 256,
                                checkPlatformCompatibility: true,

                                viewOrderConfig: const ViewOrderConfig(
                                  top: EmojiPickerItem.categoryBar,
                                  middle: EmojiPickerItem.emojiView,
                                  bottom: EmojiPickerItem.searchBar,
                                ),
                                skinToneConfig: const SkinToneConfig(),
                                categoryViewConfig: const CategoryViewConfig(),
                                bottomActionBarConfig: const BottomActionBarConfig(),
                                searchViewConfig: const SearchViewConfig(),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.emoji_emotions),
                    ),
                    hintText: "Enter the message",
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (sender.text.isNotEmpty) {
                          sendMsg(sender.text.trim());
                          log("message=>Sender Message");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: TranslateText(
                                "Please write your message",
                              ),
                            ),
                          );
                        }
                      },
                      icon: Transform.rotate(
                        angle: -45,
                        child: Icon(Icons.send),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
