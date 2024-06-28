import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportflix/Modle/event_model.dart';
import 'package:sportflix/Modules/event%20player/hd.dart';
import 'package:sportflix/Modules/event%20player/liveSport.dart';
import 'package:sportflix/shared/Cubit/cubit.dart';
import 'package:sportflix/shared/Cubit/stales.dart';
import 'package:sportflix/shared/components/components.dart';

class eventscreen extends StatelessWidget {
  const eventscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var modle=AppCubit.get(context);
    return ConditionalBuilder(
        condition: modle.evmodle!.length>0,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder:(context, index) =>  buildEventCard(context,modle.evmodle![index]),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: modle.evmodle!.length),
        ),
        fallback:(context) => Center(child: CircularProgressIndicator()),
    );
  },
);
  }
  Widget buildEventCard(context,EventModle modle)=>InkWell(
    onTap: ()
    {

      openVideoApp(videoUrl: modle.hd, sd: modle.sd, low: modle.low, fhd: modle.fhd);
    //  navigatorto(context: context, widget: hd(link: modle.hd, title: "${modle.name1} VS ${modle.name2}"));
    },
    child: Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red,)
        ),
        child:   Column(
    
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.center ,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: NetworkImage(modle.img1),
                        width: 50,
                        height:50,
                      ),
                      Text(modle.name1),
    
                    ],
    
                  ),
                  SizedBox(width: 30),
                  Container(
                    padding: EdgeInsetsDirectional.all(10),
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20)
                    ),

                      child: Center(child: Text(modle.time)),
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.center ,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: NetworkImage(modle.img2),
                        width: 50,
                        height:50,
                      ),
                      Text(modle.name2),
    
                    ],
                  ),
    
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(modle.sport),
                  SizedBox(width: 10,),
                  Image(image: AssetImage("assaets/cup.png",),width: 10,height: 10,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(modle.music),
                  Icon(Icons.mic),
                  SizedBox(width: 20,),
                  Text(modle.tv),
                  SizedBox(width: 10,),
                  Icon(Icons.live_tv),
    
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );


}
