

class EventModle
{
  late String img1;
  late String img2;
  late String name1;
  late String name2;
  late String sport;
  late String music;
  late String time;
  late String tv;
  late String low;
  late String sd;
  late String hd;
  late String fhd;
  String? doc;

  EventModle({required this.img1,required this.img2,required this.name1,required this.name2,required this.sport,required this.music,required this.tv,required this.low,required this.sd,required this.hd,required this.fhd,required this.time,this.doc});
  EventModle.formjson(Map<String,dynamic>json)
  {
    name1=json['name1'];
    name2=json['name2'];
    img1=json['img1'];
    img2=json['img2'];
    sport=json['sport'];
    music=json['music'];
    tv=json['tv'];
    time=json['time'];
    low=json['low'];
    sd=json['sd'];
    hd=json['hd'];
    fhd=json['fhd'];
    doc=json['doc'];
  }
  Map<String,dynamic>tomap()
  {
    return
      {
        "name1":name1,
        "name2":name2,
        "img1":img1,
        "img2":img2,
        "sport":sport,
        "music":music,
        "tv":tv,
        "time":time,
        "low":low,
        "sd":sd,
        "hd":hd,
        "fhd":fhd,
        "doc":doc,
      };
  }
}