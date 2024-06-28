import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sportflix/colors.dart';
import 'package:sportflix/laoyt/Home.dart';
import 'package:sportflix/shared/components/components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FlameSplashController? controller;
  void checkConnectitivy() async {
    var result = await Connectivity().checkConnectivity();

    print(result.name);
  }
 bool isas=true;
  @override
  void initState() {
    super.initState();

    controller = FlameSplashController(
      fadeInDuration: Duration(seconds: 1),
      fadeOutDuration: Duration(milliseconds: 250),
      waitDuration: Duration(seconds: 1),
      autoStart: false,

      
    );
    checkConnectitivy();


  }

  @override
  void dispose() {
    controller!.dispose();
    // dispose it when necessary
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assaets/38.png",),
            fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(215, 76, 76, 0),
        body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
            // sometimes the stream builder doesn't work with simulator so you can check this on real devices to get the right result
            print(snapshot.toString());
            if (snapshot.hasData) {
              ConnectivityResult? result = snapshot.data;
              if (result == ConnectivityResult.mobile) {
                return connected('Mobile');
              } else if (result == ConnectivityResult.wifi) {
                return connected('WIFI');
              } else {
                return noInternet();
              }
            } else {
              return loading();
            }
          },
        ),
      ),
    );

  }
  Widget loading() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kColorPrimaryDark),
      ),
    );
  }
Widget aa()
{
  return FlameSplashScreen(
    showBefore: (BuildContext context) {
      return Image(image: AssetImage("assaets/icon.png"));
    },
    onFinish: (context) =>
        navigatorfansh(context: context, widget: Home()),
    controller: controller,
    theme: FlameSplashTheme(backgroundDecoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assaets/38.png",), fit: BoxFit.fill),),
      logoBuilder: (context) =>
          Image(image: AssetImage("assaets/icon.png")),),
  );
}
  Widget connected(String type) {
    return aa();
  }

  Widget noInternet() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assaets/no_internet.png',
            color: Colors.amber,
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: const Text(
              "انت لست متصل بالانترنت تاكد من اتصالك",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text("تاكد من توصيل عب الانترنت."),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
            ),
            onPressed: () async {
              // You can also check the internet connection through this below function as well
              ConnectivityResult result = await Connectivity().checkConnectivity();
              print(result.toString());
            },
            child: const Text("Refresh"),
          ),
        ],
      ),
    );
  }

}
