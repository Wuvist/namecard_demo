import 'package:flutter/material.dart';

import 'NameCardData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NameCard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NameCardBasic(),
    );
  }
}

class NameCardBasic extends StatefulWidget {
  @override
  _NameCardBasicState createState() => new _NameCardBasicState();
}

class _NameCardBasicState extends State<NameCardBasic> {
  Future<NameCardData> futureNameCardData;

  @override
  void initState() {
    super.initState();
    futureNameCardData = fetchNameCard(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Container(
          width: 370,
          height: 250,
          color: Colors.blue,
          child: FutureBuilder<NameCardData>(
              future: futureNameCardData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading...");
                }

                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(Icons.child_friendly, size: 65),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data.name,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              snapshot.data.title,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          snapshot.data.address,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          snapshot.data.tel,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.accessibility,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.timer,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.phone_android,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.phone_iphone,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
