import 'package:flutter/material.dart';
import 'package:message/widgets/message_tile.dart';
import '../widgets/categories.dart';
import '../widgets/category_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => print('menu'),
        ),
        actions: [
          IconButton(
              onPressed: () => print('search'),
              icon: const Icon(
                Icons.search,
                size: 30,
              ))
        ],
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Column(children: [
        const Categories(),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Color.fromARGB(255, 224, 219, 219),
            ),
            child: Column(children: [
              const CategoryPage(),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: const MessageTile(),
                    // color: Colors.white,
                  ),
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
