/*
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportflix/shared/Cubit/cubit.dart';
import 'package:sportflix/shared/Cubit/stales.dart';
import 'package:video_player/video_player.dart';

class vidoeplayer extends StatelessWidget {



  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },

      builder: (context, state) {
        var modle = AppCubit.get(context);
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Divider(),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Chewie(controller: modle.chewieController),
              ),
            ],
          ),
        );
      },
    );
  }
}*/
