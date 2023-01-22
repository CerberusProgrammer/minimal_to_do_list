import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:minimal_to_do_list/completed.dart';
import 'package:minimal_to_do_list/pending.dart';
import 'package:minimal_to_do_list/priority.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  TextEditingController cTabs = TextEditingController();

  List<Widget> pages = <Widget>[
    const Priority(),
    const Pending(),
    const Completed(),
  ];

  List<Tab> tabs = <Tab>[
    const Tab(
      icon: Icon(Icons.star),
    ),
    const Tab(text: 'Tasks'),
    const Tab(text: 'Completed'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Minimal To Do'),
            bottom: TabBar(
              tabs: tabs,
              indicatorColor: Colors.amber,
            ),
          ),
          body: TabBarView(
            children: pages,
          ),
        ));
  }
}
