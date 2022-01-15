// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, unused_label

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:happy/services/bigboy.dart';
import 'package:happy/components/loading.dart';
import 'package:happy/components/part.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/one': (context) => const One(),
      },
    ));

class One extends StatefulWidget {
  const One({Key? key}) : super(key: key);

  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  dynamic data = {};
  String _url = '';
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments;
    _url = data['ticket'];
    print('dara' + data.toString());

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.white24,
          elevation: 60.0,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.home_outlined),
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/home',
                      arguments: data);
                  setState(() {
                    data = {
                      'eventname': result['eventname'],
                      'capacity': result['capacity'],
                      'eventdate': result['eventdate'],
                      'image': result['image'],
                      'description': result['description'],
                      'ticket': result['ticket']
                    };
                  });
                },
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              Spacer(),
              IconButton(
                icon: Icon(Icons.confirmation_num_outlined),
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/part',
                      arguments: data);
                  setState(() {
                    data = {
                      'eventname': result['eventname'],
                      'capacity': result['capacity'],
                      'eventdate': result['eventdate'],
                      'image': result['image'],
                      'description': result['description'],
                      'ticket': result['ticket']
                    };
                  });
                },
              ),
              Spacer(),
              IconButton(
                  icon: Icon(Icons.favorite_outline_sharp), onPressed: () {}),
              Spacer(),
              IconButton(
                  icon: Icon(Icons.account_circle_outlined), onPressed: () {}),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(data['image']),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  data['eventname'],
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Capacity:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data['capacity'].toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      data['description'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  width: 350.0,
                  height: 200.0,
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            ElevatedButton(
              onPressed: _launchURL,
              child: Text('Get Tickets'),
              style: ButtonStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
