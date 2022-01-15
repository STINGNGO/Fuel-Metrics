//espace, prefer_const_constructors, duplicate_ignore, avoid_print

// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, avoid_print, unnecessary_new

import 'package:flutter/material.dart';
import 'package:happy/screen/one.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/home': (context) => const Home(),
      },
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments;
    print('dara' + data.toString());

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white24,
        elevation: 60.0,
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home_outlined), onPressed: () {}),
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
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Text(
                        'Good morning User,',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(
                        Icons.person_outline_outlined,
                        size: 32,
                      )
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  // ignore: prefer_const_constructors
                  child: Text(
                    "How you dey?",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      children: <Widget>[
                        Card(
                          elevation: 8,
                          child: InkWell(
                            splashColor: Colors.deepOrangeAccent,
                            onTap: () {},
                            child: Container(
                              child: Icon(
                                Icons.sports_basketball_outlined,
                                size: 32,
                              ),
                              width: 80.0,
                              height: 80.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Card(
                          elevation: 8,
                          child: InkWell(
                            splashColor: Colors.deepOrangeAccent,
                            onTap: () {
                              // ignore: avoid_print
                            },
                            child: Container(
                              child: Icon(
                                Icons.food_bank_outlined,
                                size: 32,
                              ),
                              width: 80.0,
                              height: 80.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Card(
                          elevation: 8,
                          // ignore: unnecessary_new
                          child: new InkWell(
                            splashColor: Colors.deepOrangeAccent,
                            onTap: () {},
                            child: Container(
                              // ignore: prefer_const_constructors
                              child: Icon(
                                Icons.brush_outlined,
                                size: 32,
                              ),
                              width: 80.0,
                              height: 80.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Card(
                          elevation: 8,
                          // ignore: unnecessary_new
                          child: new InkWell(
                            splashColor: Colors.deepOrangeAccent,
                            onTap: () {},
                            child: Container(
                              child: Icon(
                                Icons.music_note_outlined,
                                size: 32,
                              ),
                              width: 80.0,
                              height: 80.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    " Upcoming Events ",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: <Widget>[
                      Card(
                        color: Colors.white54,
                        elevation: 20,
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            ListTile(
                              title: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0,
                                  vertical: 15,
                                ),
                                child: Text(data['eventname'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                              ),
                              subtitle: Text(
                                '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                                vertical: 15,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Text(
                                  data['description'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                            ),
                            Center(
                              child: ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      dynamic result =
                                          await Navigator.pushNamed(
                                              context, '/one',
                                              arguments: data);
                                      setState(() {
                                        data = {
                                          'eventname': result['eventname'],
                                          'capacity': result['capacity'],
                                          'eventdate': result['eventdate'],
                                          'image': result['image'],
                                          'description': result['description'],
                                        };
                                      });
                                    },
                                    child: const Text('View'),
                                  ),
                                ],
                              ),
                            ),
                            new Image.asset(data['image']),
                          ],
                        ),
                      ), //Card
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
