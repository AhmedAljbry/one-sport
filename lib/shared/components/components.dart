

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportflix/Modle/s.dart';
import 'package:sportflix/Modle/video_modle.dart';
import 'package:sportflix/a.dart';
import 'package:sportflix/liveSport.dart';
import 'package:sportflix/shared/Cubit/cubit.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

Future show(context) {
 return CoolAlert.show(
  context: context,
  type: CoolAlertType.confirm,
  text: "Your transaction was successful!",
  title: "هناك تحديث",
  onCancelBtnTap: () => Navigator.pop(context),
  onConfirmBtnTap: () {
   Navigator.pop(context);
  },


 );


}

 Future navigatorto({required context, required Widget widget})=>Navigator.push(context, MaterialPageRoute(builder: (context) => widget,));




void launchVideoPlayer(String url) async {
 if (await canLaunchUrl(Uri.parse(url))) {
  await launchUrl(Uri.parse(url));
 } else {
  // يتعذر فتح الرابط
  print("Could not launch $url");
 }
}
void _openVideoPlayer() async {
 const platform = const MethodChannel('com.example.onetv');
 try {
  // قم بنقل الروابط إلى التطبيق الثاني


  await platform.invokeMethod('openVideoPlayer', {'videoLinks': "https://www.youtube.com/watch?v=HmBEhmCZLmQ"});


 } on PlatformException catch (e) {
  print("Failed to invoke method: ${e.message}");
 }
}

void openVideoApp({required String videoUrl, required String sd, required String low, required String fhd}) async {
 String url = 'onetv://Video?url=$videoUrl,sd=$sd,hd=$low,fhd=$fhd';

 if (await canLaunch(url)) {
  await launch(url);
 } else {
  throw 'Could not launch $url';
 }
}

 Future navigatorfansh({required context,required Widget widget})=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => widget ), (route) => false);
Widget cardbuild({required VideoModle modle, required context}) => InkWell(
     onTap: ()async {
     // navigatorto(context: context, widget:  FullVideoScreen(
     // title: modle.name,
     //  link: "https://youtu.be/tK4cP0DQ3h4?si=WyhwdL72YeWsQHDN",
     //  ),
     //  );
      openVideoApp(videoUrl: modle.hd, sd: modle.sd, low: modle.low, fhd: modle.hd);


      //  navigatorto(context: context, widget: PlayVideoFromNetwork(link: modle.url,title: modle.name,));


     },
     child: Card(
      elevation: 2,
      child: Container(
       alignment: Alignment.center,
       height: 120,
       width: 100,
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
       ),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image(image: NetworkImage(modle.image),
          width: 70,
          height: 70,
         ),
         SizedBox(height: 10,),
         Center(child: Text(modle.name,style:TextStyle(fontSize: 12) ,)),
        ],
       ),
      ),
     ),
    );
Widget Gradbuild({
 required List<VideoModle>modle,
 required context,
})=> Container(
 padding: EdgeInsetsDirectional.all(8),
 decoration: const BoxDecoration(
  image:DecorationImage(
      image: AssetImage("assaets/38.png",),
      fit: BoxFit.fill
  ),
 ),
 child: GridView.count(
  crossAxisCount: 3,
  physics: BouncingScrollPhysics(),
  shrinkWrap: true,
  crossAxisSpacing: 1,
  mainAxisSpacing: 1,
  childAspectRatio: 1.50 / 1.50,
  children: List.generate(
      modle!.length,

          (index) => cardbuild(context: context,modle: modle![index])
  ),
 ),
);
 const platform = MethodChannel('com.example.stv/video');
void openVideoPlayer(String videoUrl) async {
 try {
  await platform.invokeMethod('openVideoPlayer', {'videoUrl': videoUrl});
 } on PlatformException catch (e) {
  print("Failed to open video player: ${e.message}");
 }
}
