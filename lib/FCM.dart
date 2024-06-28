/*
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';

class Channel {
  final int id;
  final String img;
  final String name;
  final Map<String, dynamic> streams;

  Channel({
    required this.id,
    required this.img,
    required this.name,
    required this.streams,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'img': img,
      'name': name,
      'streams': streams,
    };
  }
  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      img: json['img'],
      name: json['name'],
      streams: json['streams'],
    );
  }
}


class BeinSport {
  final int id;
  final String name;
  final List<Channel> channels;

  BeinSport({
    required this.id,
    required this.name,
    required this.channels,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'channels': channels.map((channel) => channel.toMap()).toList(),
    };
  }
  factory BeinSport.fromJson(Map<String, dynamic> json) {
    List<dynamic> channelsList = json['channels'];
    List<Channel> channels = channelsList.map((channelJson) => Channel.fromJson(channelJson)).toList();

    return BeinSport(
      id: json['id'],
      name: json['name'],
      channels: channels,
    );
  }

}

class TvData {
  final List<BeinSport> beinSports;

  TvData({
    required this.beinSports,
  });

  Map<String, dynamic> toMap() {
    return {
      'beinsport': beinSports.map((beinSport) => beinSport.toMap()).toList(),
    };
  }
  factory TvData.fromJson(Map<String, dynamic> json) {
    List<dynamic> beinSportsList = json['beinsport'];
    List<BeinSport> beinSports = beinSportsList.map((beinSportJson) => BeinSport.fromJson(beinSportJson)).toList();

    return TvData(
      beinSports: beinSports,
    );
  }
}

Future<void> uploadDataToFirestore() async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    // استخدام rootBundle لقراءة محتوى الملف
    String jsonString = await rootBundle.loadString('as/tv.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);

    // تحويل المحتوى إلى Document
    CollectionReference collectionRef = _firestore.collection('tv');
    TvData tvData = TvData.fromJson(jsonData['tv']);
    Map<String, dynamic> tvDataMap = tvData.toMap();

    await collectionRef.add(tvDataMap);
    print("Data uploaded successfully.");
  } catch (e) {
    print("Error uploading data: $e");
    // يمكنك التعامل مع الخطأ هنا حسب احتياجاتك
  }
}
*/
