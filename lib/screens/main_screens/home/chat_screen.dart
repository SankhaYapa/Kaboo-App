import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/compononets/custom_text_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: SafeArea(child: AppBarSection()),
          preferredSize: Size.fromHeight(size.height / 12)),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: 1,
        itemBuilder: (context, index) {
          return ChatMessageWidget(
            isSender: index % 2 == 0,
          );
        },
      ),
      bottomNavigationBar: MessageTypingWidget(),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({Key? key, required this.isSender}) : super(key: key);
  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        BubbleSpecialThree(
          isSender: isSender,
          text: 'How Can I help you Sir/Mam',
          color: isSender ? Colors.blue : Color.fromARGB(255, 134, 198, 251),
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Padding(
          padding:
              isSender ? EdgeInsets.only(right: 24) : EdgeInsets.only(left: 24),
          child: CustomText(
            text: '1 minutes ago',
            fontSize: 12,
            tColor: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class MessageTypingWidget extends StatelessWidget {
  const MessageTypingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 5,
              child: TextField(
                // controller: controller,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  //labelText: "write your message..",
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                  hintText: 'write your message..',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Icon(
              Icons.send,
              size: 40,
            ))
          ],
        ));
  }
}

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          SizedBox(
            width: 16,
          ),
          Container(
            child: CustomIcon(iconName: "logo2.png"),
            height: 58,
            width: 58,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(100))),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Kaboo Online Help",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                tColor: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Online",
                fontSize: 13,
                tColor: Color.fromARGB(255, 210, 210, 210),
              ),
            ],
          )
        ],
      ),
    );
  }
}
