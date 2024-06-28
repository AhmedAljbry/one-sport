
class VideoModle
{
  late  String name;
  late String image;
  late String low;
  late String sd;
  late String hd;
  late String fhd;
  late String? doc;

  VideoModle({required this.name, required this.image, required this.low,required this.sd,required this.hd,required this.fhd,this.doc});
  VideoModle.fromejson(Map<String,dynamic>json)
  {
    name=json['name'];
    image=json['image'];
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
        "name":name,
        "image":image,
        "low":low,
        "sd":sd,
        "low":low,
        "hd":hd,
        "fhd":fhd,
        "doc":doc,
      };
  }

}