// ignore_for_file: prefer_const_constructors, unused_label, avoid_print

import 'package:flutter/material.dart';
import 'package:happy/services/bigboy.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/part': (context) => const Part(),
      },
    ));

class Part extends StatefulWidget {
  const Part({Key? key}) : super(key: key);

  @override
  _PartState createState() => _PartState();
}

class _PartState extends State<Part> {
  List<BigBoy> part = [
    BigBoy(
        link: '222592449007/?token=7DBZ26LXRID3VRUPZ3J6',
        eventname: 'Cook To Save a Life',
        eventdate: '2022-01-25',
        capacity: 1000,
        description:
            'We want to feed as many people as we can this Festive period so as to bring joy and happiness to everyone.',
        image: 'assets/blacksanta.jpg',
        ticket:
            'https://www.eventbrite.com/e/cook-to-save-a-life-tickets-222592449007'),
    BigBoy(
        link: '223819519207/?token=7DBZ26LXRID3VRUPZ3J6',
        eventname: 'The Great Soccer',
        eventdate: '2022-02-08',
        capacity: 1000,
        description:
            '5 vs 5 football competition coming up on the 8th of February 2022. Prepare for victory.',
        image: 'assets/football.jpg',
        ticket:
            'https://www.eventbrite.com/e/the-great-soccer-tickets-223819519207'),
  ];

  void updateEvent(index) async {
    BigBoy instance = part[index];

    await instance.getEvent(index == 0
        ? '222592449007/?token=7DBZ26LXRID3VRUPZ3J6'
        : '223819519207/?token=7DBZ26LXRID3VRUPZ3J6');
    //navigate and pass data
    Navigator.pop(context, {
      'eventname': instance.eventname,
      'eventdate': instance.eventdate,
      'capacity': instance.capacity,
      'image': instance.image,
      'ticket': instance.ticket,
      'description': instance.description,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: Text('Other Events'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.white24,
      ),
      body: ListView.builder(
          itemCount: part.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: ListTile(
                    onTap: () {
                      updateEvent(index);
                    },
                    title: Text(
                      part[index].eventname ?? '',
                      style: TextStyle(fontSize: 18),
                    ),
                    leading: Icon(
                      Icons.campaign_outlined,
                      size: 32,
                    )),
              ),
            );
          }),
    );
  }
}
