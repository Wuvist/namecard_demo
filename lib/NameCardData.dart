import 'dart:convert';
import 'package:http/http.dart' as http;

class NameCardData {
  final String name;
  final String title;
  final String address;
  final String tel;

  NameCardData({this.name, this.title, this.address, this.tel});

  factory NameCardData.fromJson(Map<String, dynamic> json) {
    return NameCardData(
      name: json['name'],
      title: json['title'],
      address: json['address'],
      tel: json['tel'],
    );
  }
}

Future<NameCardData> fetchNameCard(int id) async {
  final response =
      await http.get('http://10.0.0.12:8000/$id.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return NameCardData.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
