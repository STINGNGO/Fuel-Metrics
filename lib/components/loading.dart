// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:happy/services/bigboy.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupBigBoy() async {
    BigBoy instance = BigBoy();
    //   eventname: 'BIG BOYS CLUB',
    //   eventdate: "2021-12-10",
    //   capacity: '100',
    //   image: 'assets/bigwiz.jpg',
    //   description:
    //       'This event is meant for BIG BOYS ONLY!! No money hide your face. This event would be coming up on the 10th December, 2021. Prepare yourself!',
    //   link: '221493802927/?token=7DBZ26LXRID3VRUPZ3J6',
    //   ticket: 'https://www.eventbrite.com/e/big-boys-club-tickets-221493802927',
    // );

    await instance.getEvent('221493802927/?token=7DBZ26LXRID3VRUPZ3J6');
    print(instance.eventname);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'eventname': instance.eventname,
      'eventdate': instance.eventdate,
      'capacity': instance.capacity,
      'image': instance.image,
      'description': instance.description,
      'ticket': instance.ticket,
    });
    // Navigator.pushReplacementNamed(context, '/one', arguments: {
    //   'eventname': instance.eventname,
    //   'eventdate': instance.eventdate,
    //   'capacity': instance.capacity,
    //   'image': instance.image,
    //   'description': instance.description,
    // });
  }

  @override
  void initState() {
    super.initState();
    setupBigBoy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.deepOrangeAccent,
          size: 90.0,
        ),
      ),
    );
  }
}
