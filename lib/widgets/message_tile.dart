import 'package:flutter/material.dart';
import 'package:message/models/message_model.dart';
import 'package:message/screens/chat_screen.dart';

class MessageTile extends StatefulWidget {
  const MessageTile({Key? key}) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            if (chats[index].unread == true) {
              // setState(() {
              chats[index].unread != !chats[index].unread!;
              // });
            }
            return ChatScreen(name: chats[index].sender!.name!);
          })),
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 7, 7, 7),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: chats[index].unread! ? Colors.pink[50] : Colors.white,
            ),
            margin: const EdgeInsets.fromLTRB(0, 8, 30, 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(chats[index].sender!.imageUrl!),
                  radius: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chats[index].sender!.name!,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 137, 136, 136),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          chats[index].text!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      chats[index].time!,
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (chats[index].unread!)
                      Container(
                        height: 20,
                        alignment: Alignment.center,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'NEW',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
