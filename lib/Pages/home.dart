import "package:flutter/material.dart";
import 'package:inkblob_navigation_bar/inkblob_navigation_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medmate/Pages/chats.dart';
import 'package:medmate/Pages/explore.dart';
import 'package:medmate/Pages/notifications.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  int _previousIndex = 0;
  late PageController _pageContr;
  @override
  void initState() {
    super.initState();
    _pageContr = PageController();
  }

  @override
  void dispose() {
    _pageContr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sample App Title',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(),
          )
        ],
      ),
      bottomNavigationBar: InkblobNavigationBar(
          selectedIndex: selectedIndex,
          previousIndex: _previousIndex,
          items: [
            InkblobBarItem(
              emptyIcon: const Icon(Iconsax.home_2),
              filledIcon: const Icon(Iconsax.home_25),
              color: Colors.blue,
            ),
            InkblobBarItem(
              emptyIcon: const Icon(Iconsax.notification),
              filledIcon: const Icon(Iconsax.notification1),
              color: Colors.grey,
            ),
            InkblobBarItem(
                emptyIcon: const Icon(Iconsax.message_2),
                filledIcon: const Icon(Iconsax.message_25),
                color: Colors.red),
          ],
          onItemSelected: (int index) => {
                setState(() {
                  selectedIndex = index;
                  _pageContr.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceIn);
                })
              }),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageContr,
          onPageChanged: (index) => {
            setState(() {
              _previousIndex = selectedIndex;
              selectedIndex = index;
            })
          },
          children: [Explore(), Notifications(), Chats()],
        ),
      ),
    );
  }
}
