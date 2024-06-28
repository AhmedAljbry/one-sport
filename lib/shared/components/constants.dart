
import 'package:flutter/material.dart';

const double sizeTablet = 950;

enum TypeCategory {
  all,
  live,
  movies,
  series,
}

Size getSize(BuildContext context) => MediaQuery.of(context).size;

bool isTv(BuildContext context) {
  return MediaQuery.of(context).size.width > sizeTablet;
}

/*
//https://newsapi.org/v2/everything?q=tesla&t&apiKey=b8de2af5b5ed4131941c5f8d6837ed54



import 'package:udemyflutter/modules/shop_app/Shop_Login_Screen/Login_Screen.dart';
import 'package:udemyflutter/shared/components/components.dart';
import 'package:udemyflutter/shared/network/local/cach_helper.dart';

String token='';
String? uId;
void sginout(context)
{
  CachHelper.removeDate(key: token).then((value)
  {
    if(value)
      {
        navigatortoAndFinsh(context,ShopLoginScreen());
      }
  });
}
void printFullText(String text)
{
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element)=>print(element.group(0)));
}*/
