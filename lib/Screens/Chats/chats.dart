import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';
import 'messagedb.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white04,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: white), // Set the icon color to white
        elevation: 0,
        backgroundColor: white04,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: black,
            ),
          ),
        ),
        title: Text(
          'Live chat with an admin',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                      text: messages[index]['messageContent'],
                      Uid: messages[index]['senderId'],
                      time: messages[index]['messageDateSent'],
                    );
                  },
                ),
              ),
            ),
            SendMessageField(kcontext: context)
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatefulWidget {
  final String text;
  final dynamic Uid;
  final String time;

  const MessageBubble({
    super.key,
    required this.text,
    required this.Uid,
    required this.time,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  // String? timeString = time;
  @override
  Widget build(BuildContext context) {
    String id = 'lxbdddfCET1870Gf';

    // final myModel02 = context.watch<Chats>();
    //
    // String? timeString = widget.time;
    //
    // // Parse the time string to DateTime
    // DateTime dateTime = DateTime.parse(timeString);
    //
    // // Get AM or PM
    // String amPm = dateTime.hour < 12 ? 'AM' : 'PM';
    //
    // // Format the DateTime to display hours, minutes, and AM/PM
    // String formattedTime = "${dateTime.hour}:${dateTime.minute} $amPm";
    //
    // editIt() {
    //   setState(() {
    //     messageController.text = widget.text;
    //   });
    //
    //   myModel02.editingMessage = true;
    // }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onDoubleTap: () {
          // print('widget.dmessageId: ${widget.dmessageId}');
          // myModel02.messagesId = widget.dmessageId;
          //
          // id == widget.Uid ? editIt() : null;
          //
          // print(myModel02.editingMessage);
          // print('i was clicked twice');
        },
        child: Column(
          crossAxisAlignment: id == widget.Uid
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            widget.time.isNotEmpty
                ? Column(
                    children: [
                      Center(
                        child: Text(
                          widget.time,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                    ],
                  )
                : SizedBox(
                    height: 10.h,
                  ),
            Container(
              // constraints: BoxConstraints(
              //   maxWidth: 400.w, // Set the maximum width as needed
              // ),
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                // color: id == widget.Uid ? white03 : transparent,

                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: transparent,
                  width: 2.0,
                ),
                gradient: id == widget.Uid
                    ? customGradient
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [white03, white03],
                      ),
              ),
              child: Text(
                widget.text,
                style: TextStyle(
                    color: id == widget.Uid ? white : black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 11, color: black03),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}

class SendMessageField extends StatefulWidget {
  // const SendMessageField({Key? key}) : super(key: key);

  final BuildContext kcontext;

  const SendMessageField({super.key, required this.kcontext});

  @override
  State<SendMessageField> createState() => _SendMessageFieldState();
}

class _SendMessageFieldState extends State<SendMessageField> {
  // int maxLines = 1;

  @override
  Widget build(BuildContext context) {
    // print(calculatedMaxLines);

    // maxLines = null;

    return Container(
      color: white01,
      padding: const EdgeInsets.only(top: 10, right: 10, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              // controller: messageController,
              // maxLines: null,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 15.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: transparent),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: transparent),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor01,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
                filled: true,
                fillColor: white03,
              ),
            ),
          ),
          const SizedBox(width: 2.0),
          GestureDetector(
            onTap: () async {
              // print(value.chatPartnerId);
              //
              // value.yourMessage = messageController.text;
              //
              // // await value.sendMessage();
              //
              // value.editingMessage
              //     ? await value.editMessage(context)
              //     : value.sendMessage(chattingId, context);
              //
              // // value.editingMessage == true
              // //     ? Navigator.pop(widget.kcontext)
              // //     : null;
              //
              // value.editingMessage = false;
              // // Clear the TextField after sending the message
              // messageController.clear();
            },
            child: IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor:
                    primaryColor01, // Background color for the circular button
                radius: 22,
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white, // Icon color set to white
                  size: 30,
                ),
              ),
            ),
          ),
          // S(w: 8.0),
        ],
      ),
    );
  }
}