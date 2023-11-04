import 'package:flutter/material.dart';
import 'package:riverpod_demo/pages/basic_provider.dart';
import 'package:riverpod_demo/pages/future_provider.dart';
import 'package:riverpod_demo/pages/state_provider.dart';
import 'package:riverpod_demo/pages/stream_provider.dart';

class Pageview extends StatefulWidget {
  const Pageview({super.key});

  @override
  State<Pageview> createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  int currentItem = 0;
  int currentPage = 0;
  List<Widget> bottomItems = [
    const Basicprovider(),
    const Stateprovider(),
    const Futureprovider(),
    const Streamprovider()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        // physics: NeverScrollableScrollPhysics(),
        children: bottomItems,
        onPageChanged: (pageindex) {
          setState(() {
            currentItem = pageindex;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentItem,
        backgroundColor: Colors.grey.shade300,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions),
            label: 'Data',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions), label: 'Data'),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions), label: 'Data'),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions), label: 'Data'),
        ],
        onTap: (e) {
          setState(() {
            currentItem = e;
            pageController.animateToPage(e,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn);
          });
        },
      ),
    );
  }
}
