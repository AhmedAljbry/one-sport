import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportflix/Modle/s.dart';
import 'package:sportflix/colors.dart';
import 'package:sportflix/shared/Cubit/cubit.dart';
import 'package:sportflix/shared/Cubit/stales.dart';
import 'package:url_launcher/url_launcher.dart';



class Home extends StatelessWidget {

   Home({super.key});
   smodle? s;
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   Future<void> _launchUrl(String name,context) async {
  var a=AppCubit.get(context);
  var url;
  if(name=="web")
  {
    url=Uri.parse(a.em!.weib);
    print("====================================");
    print(url);
    print("====================================");
  }
  else if(name=="email")
    {
      url=Uri.parse(a.em!.email);
    }
  else if(name=="facbook")
    {
      url=Uri.parse(a.em!.fac);
    }
  else if(name=="telegram")
  {
    url=Uri.parse(a.em!.te);
  }
  else if(name=="instagram")
  {
    url=Uri.parse(a.em!.ins);
  }
  else if(name=="whatsapp")
  {
    url=Uri.parse(a.em!.wat);
  }
  else if(name=="youtube")
  {
    url=Uri.parse(a.em!.you);
  }
  else if(name=="p")
  {
    url=Uri.parse(a.em!.p);
  }

  else
    {
      throw "ارابط غير موجد ${url}";
    }
  if( await canLaunchUrl(url)){
    await launchUrl(url);
  }else{
    throw 'Could not launch $url';
  }

}
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {

          return Scaffold(



            key: _scaffoldKey,
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.menu,), onPressed: ()
              {

                _scaffoldKey.currentState!.openDrawer();
              },),
              backgroundColor:kColorPrimaryDark,
              title: Text(AppCubit.get(context).title![AppCubit.get(context).currentIndex]),
              actions: [
                IconButton(onPressed: () {},
                    icon: const Icon(Icons.search_rounded)),
              ],
            ),
            drawer: Drawer(

              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: kColorPrimaryDark,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'تواصل معنا',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        IconButton(onPressed: ()
                        {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back,color: Colors.white,))
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.web),
                    title: Text('تحميل تطبيق'),
                    onTap: () {
                      _launchUrl("web",context);

                     //
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('تواصل معنا عبر البريد'),
                    onTap: () {
                      _launchUrl("email", context);
                      // إغلاق الـ Drawer وتنفيذ الإجراء المناسب للإعدادات
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.facebook),
                    title: Text('تابع عبر الفيس بوك'),
                    onTap: () {
                      // إغلاق الـ Drawer وتنفيذ الإجراء المناسب للإعدادات
                      _launchUrl("facbook", context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.telegram),
                    title: Text('انظم الى قناتي تلجرام'),
                    onTap: () {
                      // إغلاق الـ Drawer وتنفيذ الإجراء المناسب للإعدادات
                      _launchUrl("telegram", context);

                    },
                  ),
                  ListTile(
                    leading: Image(image: AssetImage("assaets/5811465.png"),width: 30,height: 30),
                    title: Text('تابعنا على انستجرام'),
                    onTap: () {
                      // إغلاق الـ Drawer وتنفيذ الإجراء المناسب للإعدادات
                      _launchUrl("instagram", context);

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.chat_outlined),
                    title: Text('انظم الى وتس اب'),
                    onTap: () {
                      // إغلاق الـ Drawer وتنفيذ الإجراء المناسب للإعدادات
                      _launchUrl("whatsapp", context);
                    },
                  ),
                  ListTile(
                    leading: Image(image: AssetImage("assaets/youtube-icon.png"),width: 30,height: 30),
                    title: Text('انظم الى قناتي على يوتيوب'),
                    onTap: () {
                      // إغلاق الـ Drawer وتنفيذ الإجراء المناسب للإعدادات
                      _launchUrl("youtube", context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip),
                    title: Text('سياسة الخصوصية'),
                    onTap: () {
                      // إغلاق الـ Drawer وتنفيذ الإجراء المناسب للإعدادات
                      _launchUrl("p", context);

                    },
                  ),

                ],
              ),
            ),
            body:OrientationBuilder(
    builder: (context, orientation) {
      // قم بتحديد التوجيه الذي تريده هنا
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitUp,
      ]);

      return AppCubit
          .get(context)
          .scrren![AppCubit
          .get(context)
          .currentIndex];
    }),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.live_tv,color: Colors.white), label: 'live tv',backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today,color:Colors.white), label: 'live event',),
              ],
              onTap: (index) {
                AppCubit.get(context).BottomNavigationBar(index);
              },
              currentIndex: AppCubit.get(context).currentIndex,
              backgroundColor:kColorPrimaryDark,
            ),


          );
        },
      );


  }
   Future show(context)
   {
     return  CoolAlert.show(
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

}
