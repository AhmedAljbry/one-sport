class playModle
{

  late String url;

  playModle({required this.url});
  playModle.fromejson(Map<String,dynamic>json)
  {

    url=json['url'];
  }

}