



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportflix/Modle/CatageroyModle.dart';
import 'package:sportflix/Modle/emmodle.dart';
import 'package:sportflix/Modle/event_model.dart';
import 'package:sportflix/Modle/s.dart';
import 'package:sportflix/Modle/video_modle.dart';
import 'package:sportflix/Modules/Live_Screen.dart';
import 'package:sportflix/Modules/event_screen.dart';
import 'package:sportflix/shared/Cubit/stales.dart';




class AppCubit extends Cubit<AppStates> {
  AppCubit() :super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  List<Widget>?scrren = [
    LiveScreen(),
    eventscreen(),

  ];
  List<String>? title = [
    "Sport Flix tv",
    "Live Event",

  ];
  int currentIndex = 0;

  void BottomNavigationBar(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavigationBar());
  }

  void drowopne(GlobalKey<ScaffoldState>? scaffoldKey )
  {
    scaffoldKey!.currentState!.openDrawer();
    emit(AppChangeDraw());
  }
   VideoModle? modle;
  late List<VideoModle>wwee=[];


  catageroymodle? cmodle;
  List<catageroymodle> catageroylist=[];
  void getCatagory()
  {
    emit(AppCatagoryLoding());
    FirebaseFirestore.instance.collection("tv").get().then((value)
    {
      value.docs.forEach((element) {
        catageroylist.add(catageroymodle.formjson(element.data()));
      });
      emit(AppCatagorySucsses());
    }).catchError((err)
    {
      emit(AppCatagoryerr(err: err.toString()));
    });
  }

  VideoModle? videoModle;
  List<VideoModle> videolist=[];
  void GetTv({required String id})async
  {

    emit(AppTvLoding());
   await FirebaseFirestore.instance.collection('tv').doc(id).collection("watch").get().then((value)
    {
       value.docs.forEach((element) {

         videolist!.add(VideoModle.fromejson(element.data()!));
         print("=======================");
         print(element.data());
         print("=======================");
      });
      emit(AppTvSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppTverr(err: err.toString()));
    });
  }

  List<EventModle>?evmodle=[];
  void getevent()async
  {
    emit(AppeventLoding());



    FirebaseFirestore.instance.collection('event').get().then((value)
    {
      value.docs.forEach((element) {
        evmodle!.add(EventModle.formjson(element.data()!));

      });

      emit(AppeventSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(Appeventerr(err: err.toString()));
    });

  }
 late DocumentReference<Map<String, dynamic>> beinfir=FirebaseFirestore.instance.collection('bein_sport').doc('b');
  late List<VideoModle>bein4k=[];
  void getbein4k()async
  {

    emit(Appbein4kLoding());
    await beinfir.collection("bein_sport_4k").get().then((value)
    {
      value.docs.forEach((element) {

        bein4k!.add(VideoModle.fromejson(element.data()!));

      });
      emit(Appbein4kSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(Appbein4kerr(err: err.toString()));
    });
  }
  late List<VideoModle>beinmini=[];
  void getbeinmini()async
  {

    emit(AppbeinMiniLoding());
    await beinfir.collection("bein_sport_mini").get().then((value)
    {
      value.docs.forEach((element) {


        beinmini!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppbeinMiniSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppbeinMinierr(err: err.toString()));
    });
  }
  late List<VideoModle>beinhd=[];
  void getbeinhd()async
  {

    emit(AppbeinhdLoding());
    await beinfir.collection("bein_sport_hd").get().then((value)
    {
      value.docs.forEach((element) {


        beinhd!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppbeinhdSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(Appbeinhderr(err: err.toString()));
    });
  }
  late List<VideoModle>beinhevc=[];
  void getbeinhevc()async
  {

    emit(AppbeinHevcLoding());
    await beinfir.collection("bein_sport_hevc").get().then((value)
    {
      value.docs.forEach((element) {


        beinhevc!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppbeinHevcSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppbeinHevcerr(err: err.toString()));
    });
  }
  late List<VideoModle>beinlow=[];
  void getbeinlow()async
  {

    emit(AppbeinLowLoding());
    await beinfir.collection("bein_sport_low").get().then((value)
    {
      value.docs.forEach((element) {


        beinlow!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppbeinLowSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppbeinLowerr(err: err.toString()));
    });
  }
  late List<VideoModle>beinsd=[];
  void getbeinsd()async
  {

    emit(AppbeinsdLoding());
    await beinfir.collection("bein_sport_sd").get().then((value)
    {
      value.docs.forEach((element) {

        beinsd!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppbeinsdSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(Appbeinsderr(err: err.toString()));
    });
  }
  late List<VideoModle>ssclow=[];
  late CollectionReference<Map<String, dynamic>> sscfir=FirebaseFirestore.instance.collection('ssc_sport');
  void getssclow()async
  {

    emit(AppSscLowLoding());
    await sscfir.doc('s').collection("ssc_sport_low").get().then((value)
    {
      value.docs.forEach((element) {

        ssclow!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppSscLowSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppSscLowerr(err: err.toString()));
    });
  }
  late List<VideoModle>sscfhd=[];
  void getsscfhd()async
  {

    emit(AppSscFHDLoding());
    await sscfir.doc('ssc_fhd').collection("ssc_sport_fhd").get().then((value)
    {
      value.docs.forEach((element) {


        sscfhd!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppSscFHDSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppSscFHDerr(err: err.toString()));
    });
  }
  late List<VideoModle>sschd=[];
  void getsschd()async
  {

    emit(AppSscHDLoding());
    await sscfir.doc('ssc_hd').collection("ssc_sport_hd").get().then((value)
    {
      value.docs.forEach((element) {

        sschd!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppSscHDSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppSscHDerr(err: err.toString()));
    });
  }
  late List<VideoModle>sscsd=[];
  void getsscsd()async
  {

    emit(AppSscSDLoding());
    await sscfir.doc('ssc_sd').collection("ssc_sport_sd").get().then((value)
    {
      value.docs.forEach((element) {

        sscsd!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppSscSDSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppSscHDerr(err: err.toString()));
    });
  }
  late List<VideoModle>adsport=[];
  void getadsport()async
  {

    emit(AppADsportLoding());
    await FirebaseFirestore.instance.collection('adsport').doc('adsport').collection("adsport").get().then((value)
    {
      value.docs.forEach((element) {


        adsport!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppADsportSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppADsporterr(err: err.toString()));
    });
  }
  late List<VideoModle>alkass=[];
  void getalkass()async
  {

    emit(AppALKassLoding());
    await FirebaseFirestore.instance.collection('alkass').doc('alkass').collection("alkass").get().then((value)
    {
      value.docs.forEach((element) {


        alkass!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppADsportSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppALKasserr(err: err.toString()));
    });
  }
  late List<VideoModle>arsport=[];
  void getarsport()async
  {

    emit(AppARSportLoding());
    await FirebaseFirestore.instance.collection('arabic sport').doc('ar').collection("ar").get().then((value)
    {
      value.docs.forEach((element) {


        arsport!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppARSportSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppARSporterr(err: err.toString()));
    });
  }
  late List<VideoModle>ba=[];
  void getba()async
  {

    emit(AppbaLoding());
    await FirebaseFirestore.instance.collection('bein_sport').doc('b').collection("beIN_ASIAN_CUP_MINI").get().then((value)
    {
      value.docs.forEach((element) {


        ba!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppbaSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(Appbaeerr(err: err.toString()));
    });
  }
  late List<VideoModle>bm=[];
  void getbm()async
  {

    emit(AppbmLoding());
    await FirebaseFirestore.instance.collection('bein_sport').doc('b').collection("cbeIN_SPORTS_MAX _MINI").get().then((value)
    {
      value.docs.forEach((element) {


        bm!.add(VideoModle.fromejson(element.data()!));

      });
      emit(AppbmSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(Appbmeerr(err: err.toString()));
    });
  }
  late List<VideoModle>beinm=[];
  void getbeinm()async
  {

    emit(AppbeinMLoding());
    await FirebaseFirestore.instance.collection('bein movies').doc('bin').collection('m').get().then((value)
    {
      value.docs.forEach((element) {


        print(element.data());

      });

      emit(AppbeinMSucsses());
    }).catchError((err)
    {
      print(err.toString());
      emit(AppbeinMerr(err: err.toString()));
    });
  }

 emmodle? em;
void getem()
{
  emit(AppemLoding());
  FirebaseFirestore.instance.collection("em").doc("8xArVvrjTAoFVDWklvOk").get().then((value)
  {

    em=emmodle.formjson(value.data()!);

    emit(AppemSucsses());
  }).catchError((err)
  {
    emit(Appemeerr(err: err.toString()));
    print(err.toString());
  });
}

  smodle? si;
void iss()
{
  emit(AppisLoding());
  FirebaseFirestore.instance.collection("iss").doc("iaraAFFuAy2bSoaNdiTA").get().then((value)
  {
    si=smodle.formjson(value.data()!);
    print("===================================");
    print(value.data());
    print("======================================================");
    emit(AppisSucsses());
  });

}


/*  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  void setvidoeplayer({
    required String url,
  }) {
    emit(AppvideoLoding());
    VideoPlayerController.network(url);


    videoPlayerController.initialize().then((value)
    {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 16 / 9,
      );
      emit(AppvideoSucsses());
    }).catchError((err)
    {
      emit(Appvideoerr(err: err.toString()));
    });
  }*/
}



