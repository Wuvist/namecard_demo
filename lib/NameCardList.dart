import 'package:flutter/material.dart';

import 'NameCardData.dart';

class NameCardList extends StatefulWidget {
  @override
  _NameCardListState createState() => new _NameCardListState();
}

class _NameCardListState extends State<NameCardList> {
  Future<List<NameCardListItem>> futureNameCardListData;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    futureNameCardListData = fetchNameCards();
  }

  Widget _buildRow(NameCardListItem item) {
    return ListTile(
      title: Text(
        item.name,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Name cards'),
      ),
      body: FutureBuilder<List<NameCardListItem>>(
        future: futureNameCardListData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error.toString()}");
          }
          if (!snapshot.hasData) {
            return Text("Loading..");
          }

          return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: snapshot.data.length * 2,
              itemBuilder: (context, i) {
                if (i.isOdd) return Divider();

                final index = i ~/ 2;
                return _buildRow(snapshot.data[index]);
              });
        }),
    );
  }
}
