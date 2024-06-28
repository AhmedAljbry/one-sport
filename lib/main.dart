import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sportflix/FCM.dart';
import 'package:sportflix/MyBlocObserver.dart';
import 'package:sportflix/laoyt/Home.dart';
import 'package:sportflix/laoyt/SplashScreen.dart';
import 'package:sportflix/shared/Cubit/cubit.dart';
import 'package:sportflix/shared/Cubit/stales.dart';
import 'package:sportflix/shared/styles/themes.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.data.toString());
  print("back ground");
}
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDN4mXAI9qPgetAIu3FAs327t3nuwE-y7s",
        appId: "1:551837837534:android:d3b1ed09a8680705bb7a4f",
        messagingSenderId: "551837837534",
        projectId: "chatmessage-b2d2a")
  );
  Bloc.observer = MyBlocObserver();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  final Uri initialUri = Uri.parse("https://www.sportflix.com/");
  final String userId = initialUri.queryParameters['userId'] ?? '';
  final String category = initialUri.queryParameters['category'] ?? '';

  FirebaseMessaging.onMessage.listen((event) {
    print("=======================================");
    print('====================${event.data.toString()}=======================');
    print("=======================================");
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print("=======================================");
    print('====================${event.data.toString()}=======================');
    print("=======================================");
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //uploadDataToFirestore();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => AppCubit()..getCatagory()..getevent(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {

          return GetMaterialApp(
           // theme: MyThemApp.themeData(context),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),

          );
        },
      ),
    );
  }
}
