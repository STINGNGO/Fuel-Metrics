import 'package:flutter/material.dart';
import 'package:happy/components/home.dart';
import 'package:happy/components/part.dart';
import 'package:happy/components/loading.dart';
import 'package:happy/screen/one.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/loading",
      routes: {
        '/home': (context) => const Home(),
        '/loading': (context) => const Loading(),
        '/one': (context) => const One(),
        '/part': (context) => const Part()
      },
    ));
