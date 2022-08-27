import 'package:flutter/material.dart';
import 'package:message/models/message_model.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({required this.name, Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                size: 30,
              ))
        ],
        centerTitle: true,
        title: Text(
          widget.name,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment:
                          currentUser.id == messages[index].sender!.id
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: currentUser.id == messages[index].sender!.id
                                ? Colors.pink[50]
                                : Colors.amber[50],
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  currentUser.id == messages[index].sender!.id
                                      ? const Radius.circular(15)
                                      : const Radius.circular(0),
                              bottomLeft:
                                  currentUser.id == messages[index].sender!.id
                                      ? const Radius.circular(15)
                                      : const Radius.circular(0),
                              topRight:
                                  currentUser.id == messages[index].sender!.id
                                      ? const Radius.circular(0)
                                      : const Radius.circular(15),
                              bottomRight:
                                  currentUser.id == messages[index].sender!.id
                                      ? const Radius.circular(0)
                                      : const Radius.circular(15),
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(messages[index].time!,
                                  style: const TextStyle(color: Colors.black)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                messages[index].text!,
                                style: TextStyle(color: Colors.indigo[800]),
                              )
                            ],
                          ),
                        ),
                        if (currentUser.id != messages[index].sender!.id)
                          IconButton(
                            icon: messages[index].isLiked!
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                print('pressed');
                                // messages[index].
                                print(messages[index].isLiked);
                              });
                            },
                          ),
                      ],
                    );
                  },
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => print('message sent'),
                    ),
                    prefixIcon: const Icon(
                      Icons.image,
                      color: Colors.red,
                    ),
                    hintText: 'Enter a message...'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
