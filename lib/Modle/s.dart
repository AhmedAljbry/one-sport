class smodle
{
  late bool iss;
  late String url;
  smodle.formjson(Map<String,dynamic>json)
  {
    iss=json['iss'];
    url=json['url'];
  }
}