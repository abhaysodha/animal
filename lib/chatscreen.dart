import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  Widget _buildTextComposer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration:
                const InputDecoration.collapsed(hintText: "send a massage"),
          ),
        ),
        const Icon(
          Icons.send,
        )
      ],
    ).px(16);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text('ChatGPT Demo',
              style: TextStyle(
                color: Colors.black,
              )),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Flexible(
              child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _messages[index];
            },
          )),
          Container(
            decoration: BoxDecoration(
              color: context.cardColor,
            ),
            child: _buildTextComposer(),
          )
        ]),
      ),
    );
  }
}
