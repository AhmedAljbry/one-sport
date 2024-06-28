

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';

import 'package:sportflix/colors.dart';
import 'package:sportflix/laoyt/Home.dart';
import 'package:sportflix/shared/components/components.dart';

class hd extends StatefulWidget {
  const hd({Key? key, required this.link, required this.title}) : super(key: key);
  final String link;
  final String title;
  @override
  State<hd> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<hd> {
  late final PodPlayerController controller;

  @override
  void initState() {

    controller = PodPlayerController(

      playVideoFrom: PlayVideoFrom.network(

        widget.link,
        videoPlayerOptions: VideoPlayerOptions(),

      ),

      podPlayerConfig:  const PodPlayerConfig(
        autoPlay: true,
        isLooping: true,
        videoQualityPriority: [720, 360],
        forcedVideoFocus: false,
        wakelockEnabled: true,
      ),


    )..initialise();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    debugPrint("SIZE: ${MediaQuery.of(context).size.width}");
    return Scaffold(
        backgroundColor: Colors.black,
        body:OrientationBuilder(
        builder: (context, orientation)
    {
      // قم بتحديد التوجيه الذي تريده هنا
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      return PodVideoPlayer(
        controller: controller,
        backgroundColor: Colors.black,
        podProgressBarConfig: PodProgressBarConfig(backgroundColor: Colors.black),
        alwaysShowProgressBar: true,
        videoTitle: Row(
          children: [
            IconButton(onPressed: ()
            {
              navigatorfansh(context: context, widget: Home());
            }, icon: Icon(Icons.add)),
            Text(
              widget.title,
              maxLines: 1,
              style: Get.textTheme.labelLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),

            ),
          ],
        ),
        podPlayerLabels: PodPlayerLabels(fullscreen: widget.title,),


        matchFrameAspectRatioToVideo: true,
        matchVideoAspectRatioToFrame: true,

        onLoading: (context) =>
        const Center(child: CircularProgressIndicator(),),

      );
    })
    );
  }

}