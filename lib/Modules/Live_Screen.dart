import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sportflix/Modle/CatageroyModle.dart';
import 'package:sportflix/Modle/s.dart';
import 'package:sportflix/Modules/ADSPORTS.dart';
import 'package:sportflix/Modules/ALKASSSPORT.dart';
import 'package:sportflix/Modules/ArabicSPORT.dart';
import 'package:sportflix/Modules/BeinMovies.dart';
import 'package:sportflix/Modules/SSCSPORTFHD.dart';
import 'package:sportflix/Modules/SSCSPORTHD.dart';
import 'package:sportflix/Modules/SSCSPORTLOW.dart';
import 'package:sportflix/Modules/SSCSPORTSD.dart';
import 'package:sportflix/Modules/Tv_Screen.dart';
import 'package:sportflix/Modules/ba.dart';
import 'package:sportflix/Modules/beINSPORTSHD.dart';
import 'package:sportflix/Modules/beINSPORTSHEVC.dart';
import 'package:sportflix/Modules/bm.dart';
import 'package:sportflix/Modules/wuscreen.dart';
import 'package:sportflix/shared/Cubit/cubit.dart';
import 'package:sportflix/shared/Cubit/stales.dart';
import 'package:sportflix/shared/components/components.dart';
import 'package:url_launcher/url_launcher.dart';


import 'beINSPORTSLOW.dart';
import 'beINSPORTSMINI.dart';
import 'beINSPORTSSD.dart';
import 'beINSport4K.dart';


class LiveScreen extends StatelessWidget {
  LiveScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var modle=AppCubit.get(context);
        return ConditionalBuilder(
            condition: modle.catageroylist.length>0,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>catagorybuild(modle: modle.catageroylist[index],context:context),

                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemCount: modle.catageroylist.length),
            fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget catagorybuild({required catageroymodle modle,required context})=>     InkWell(
    onTap: ()
    {
      navigatorto(context: context, widget: Tv_Screen(id: modle.doc!));
    },
    child: Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.red,),
          color: Colors.white,

        ),
        height: 50,
        width: double.infinity,

        child: Center(child: Text(modle.name)),
      ),
    ),
  );
}
