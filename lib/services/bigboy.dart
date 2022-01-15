// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class BigBoy {
  String? eventname; //name of the event
  String? eventdate; //date of the event
  int? capacity; //capacity of the event
  String? description; //description of the event
  String? image; //url to image of the event
  String? link;
  String? start;
  String? ticket; //event url for api endpoint

  BigBoy(
      {this.eventname,
      this.eventdate,
      this.capacity,
      this.description,
      this.image,
      this.link,
      this.start,
      this.ticket});

  Future<void> getEvent(String link) async {
    try {
      //make the request
      Response response =
          await get(Uri.parse('https://www.eventbriteapi.com/v3/events/$link'));
      dynamic data = jsonDecode(response.body);
      print(data);

      // get properties from data
      this.eventname = data["name"]['text'];
      this.description = data['description']['text'];

      this.capacity = data['capacity'];
      this.start = data['start']['local'];

      this.ticket = data['url'];
      this.image = 'assets/bigwiz.jpg';
      print(eventname);
      print(description);

      print(capacity);
      print(start);

      DateTime now = DateTime.parse(this.start ?? '');
      this.eventdate = DateFormat('yyyy-MM-dd').format(now);
      print(this.eventdate);
    } catch (e) {
      print('Caught error : $e');
      eventdate = 'could not get event date';
    }
  }
}
