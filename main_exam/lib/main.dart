import 'dart:async';

import 'package:flutter/material.dart';
import 'package:main_exam/secondscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const Home(),
      'secondscreen': (context) => Secondscreen(),
    },
  ));
}


List time = [];
List time1 = [];
List time2 = [];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int s = 0;
  int m = 0;
  int h = 0;
  stopwatch() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        s = DateTime.now().second;
        m = DateTime.now().minute;
        h = DateTime.now().hour;
      });
      stopwatch();
    });
  }

  void initState() {
    stopwatch();
    super.initState();
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('My App'),
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Transform.scale(
                  scale: 8,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.pinkAccent,
                    value: s / 60,
                  ),
                ),
                Transform.scale(
                  scale: 6,
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    color: Colors.greenAccent,
                    value: DateTime.now().minute / 60,
                  ),
                ),
                Transform.scale(
                  scale: 4,
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    color: Colors.teal,
                    value: h / 12,
                  ),
                ),
                Text("$h:$m:$s"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pushNamed(
                  'secondscreen',
                  arguments: s,
                );
                if (!time2.contains(h)) {
                  time.add(h);
                }
                if (!time1.contains(m)) {
                  time.add(m);
                }
                if (!time.contains(s)) {
                  time.add(s);
                }
              });
            },
            child: Container(
              height: 40,
              width: 100,
              color: Colors.yellow,
              margin: EdgeInsets.only(top: 200),
              child: Center(child: Text("$h:$m:$s")),
            ),
          ),
        ],
      ),
    );
  }
}
