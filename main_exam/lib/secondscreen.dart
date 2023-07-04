import 'package:flutter/material.dart';
import 'main.dart';

class Secondscreen extends StatefulWidget {
  Secondscreen({Key? key}) : super(key: key);

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            time = [];
            time1 = [];
            time2 = [];
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton:
          IconButton(onPressed: () {}, icon: Icon(Icons.skip_next)),
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(top: 300),
          color: Colors.pink,
          child: Row(
            children: [
              ...time1
                  .map(
                    (e) => Text(
                      "$e :",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                  .toList(),
              ...time
                  .map(
                    (e) => Text("$e "),
                  )
                  .toList(),
              ...time2
                  .map(
                    (e) => Text("$e : \n"),
                  )
                  .toList()
            ],
          ),
        )
      ]),
    );
  }
}
